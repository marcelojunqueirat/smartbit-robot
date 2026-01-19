import psycopg2
from typing import Dict, Any
import os
from dotenv import load_dotenv

load_dotenv()

db_conn = f"""
        host='{os.getenv('DB_HOST')}'
        dbname='{os.getenv('DB_NAME')}'
        user='{os.getenv('DB_USER')}'
        password='{os.getenv('DB_PASS')}'
        """

def execute(query: str) -> None:
    conn = psycopg2.connect(db_conn)
    cursor = conn.cursor()
    cursor.execute(query)
    
    conn.commit()
    conn.close()

def insert_membership(data: Dict[str, Any]) -> None:

    account= data["account"]
    plan= data["plan"]
    credit_card= data["credit_card"]["number"][-4]

    query=f"""
        BEGIN; -- Inicia uma transação

        -- Remove o registro pelo email
        DELETE FROM accounts
        WHERE email = '{account["email"]}';

        -- Insere uma nova conta e obtém o ID da conta recém-inserida
        WITH new_account AS (
            INSERT INTO accounts (name, email, cpf)
            VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}')
            RETURNING id
        )

        -- Insere um registro na tabela memberships com o ID da conta
        INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
        SELECT id, {plan["id"]}, '{credit_card}', {plan["price"]}, true
        FROM new_account;

        COMMIT; -- Confirma a transação
    """
    execute(query)

def insert_account(account: Dict[str, str]) -> None:
    query= f"""
            INSERT INTO accounts (name, email, cpf) 
            VALUES('{account["name"]}', '{account["email"]}', {account["cpf"]});
            """
    execute(query)

def delete_account_by_email(email: str) -> None:
    query= f"DELETE FROM accounts WHERE email ='{email}';"
    execute(query)
