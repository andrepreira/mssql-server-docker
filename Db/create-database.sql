CREATE DATABASE [product-db]
GO

USE [product-db];
GO

CREATE TABLE parentes_incompleto_limpo  (
     CPF  varchar(255) null,
     NOME  varchar(255) null,
     NOME_VINCULO  varchar(255) null,
     CPF_VINCULO_9  varchar(255) null,
     VINCULO  varchar(255) null,
     CPF_Completo  varchar(255) null,
     CPF_VINCULO  varchar(255) null
  )
GO

CREATE TABLE parentes_incompleto  (
     CPF  varchar(255) null,
     NOME  varchar(255) null,
     NOME_VINCULO  varchar(255) null,
     CPF_VINCULO_9  varchar(255) null,
     VINCULO  varchar(255) null,
     CPF_Completo  varchar(255) null,
     CPF_VINCULO  varchar(255) null
  )
GO

CREATE TABLE parentes  (
     CPF  varchar(255) null,
     NOME  varchar(255) null,
     NOME_VINCULO  varchar(255) null,
     CPF_VINCULO_9  varchar(255) null,
     VINCULO  varchar(255) null,
     CPF_Completo  varchar(255) null,
     CPF_VINCULO  varchar(255) null
  )
GO