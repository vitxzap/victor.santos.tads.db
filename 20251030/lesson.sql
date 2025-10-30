-- exec 01
CREATE OR REPLACE TRIGGER logVendas
AFTER UPDATE ON VENDAS
FOR EACH ROW
BEGIN    
    UPDATE LOGS_VENDAS 
    SET operacao = "UPDATE",
        produto = :NEW.produto,
        vendedor = :NEW.vendedor,
        valor = :NEW.valor,
        usuario = :NEW.usuario,
        data_hora = CURRENT_DATE
    WHERE id_venda = :NEW.id;
END;


-- exec 02
CREATE OR REPLACE PROCEDURE total_vendas_vendedor
    (
    nome_vendedor IN VARCHAR2
    )
    IS
    BEGIN
        SELECT  vendedor, SUM(valor) as total FROM VENDAS WHERE vendedor = 'Carlos' GROUP BY vendedor;
    END total_vendas_vendedor;


-- exec 03
CREATE OR REPLACE TRIGGER validar
BEFORE INSERT 
ON VENDAS
FOR EACH ROW
    DECLARE
    vendas_valor_minimo EXCEPTION;
    PRAGMA EXCEPTION_INIT (vendas_valor_minimo, -6502); 
    BEGIN
        IF :NEW.valor <= 0 THEN 
            RAISE vendas_valor_minimo;
        END IF;
    END;