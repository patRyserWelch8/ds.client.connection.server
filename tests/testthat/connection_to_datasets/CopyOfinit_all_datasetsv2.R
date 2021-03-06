# TESTING.DATASET3.
# Author: Patricia Ryser-Welch, DataSHIELD team

# Connect to three servers and the three datasets. Four local variables named ds.test_env$local.values.1,
# ds.test_env$local.values.2, ds.test_env$local.values.3 and ds.test_env$local.values are created.
# version 2.1a - 17/02/2020 - Some issues with accessing the ds.test_env environment were experienced. Only inside certain 
# functions the connections were able to be reached. For that reason, the connect functions have been altered to return a connection.


init.all.datasets <- function()
{
 
  if (ds.test_env$secure_login_details)
  {
    #reading data from local files 
    ds.test_env$local.values.1 <- read.csv("data_files/DATASET1.csv", header = TRUE)
    ds.test_env$local.values.2 <- read.csv("data_files/DATASET2.csv", header = TRUE)
    ds.test_env$local.values.3 <- read.csv("data_files/DATASET3.csv", header = TRUE)
    ds.test_env$local.values   <- rbind(ds.test_env$local.values.1,ds.test_env$local.values.2,ds.test_env$local.values.3)
    if (ds.test_env$driver == "OpalDriver") 
    {
      #connecting to the servers
      ds.test_env$server <- c("study1", "study2", "study3")
      ds.test_env$url <- c(ds.test_env$ip_address_1,ds.test_env$ip_address_2,ds.test_env$ip_address_3)
      ds.test_env$user <- c(ds.test_env$user_1,ds.test_env$user_2,ds.test_env$user_3)
      ds.test_env$password <- c(ds.test_env$password_1,ds.test_env$password_2,ds.test_env$password_3)
      ds.test_env$table <- c("TESTING.DATASET1", "TESTING.DATASET2", "TESTING.DATASET3")
      ds.test_env$login.data <- datashield.build.login.data.frame.o(ds.test_env$server,
                                                                    ds.test_env$url,
                                                                    ds.test_env$table,
                                                                    ds.test_env$user,
                                                                    ds.test_env$password,
                                                                    .silent = TRUE)
    }
    else 
    {
      ds.test_env$login.data <- DSLite::setupDATASETTest("dsBase", env = ds.test_env)
    }
    ds.test_env$stats.var <- list('ID','CHARACTER', 'LOGICAL','NA_VALUES','INTEGER','NULL_VALUES',
                                  'NON_NEGATIVE_INTEGER','POSITIVE_INTEGER','NEGATIVE_INTEGER',
                                  'NUMERIC', 'NON_NEGATIVE_NUMERIC','POSITIVE_NUMERIC','NEGATIVE_NUMERIC','FACTOR_CHARACTER', 
                                  'FACTOR_INTEGER','IDENTIFIER','CATEGORY','IDENTIFIER','CATEGORY')
  }
}

# Connect to one server and the three datasets. One local variables named ds.test_env$local.values.3 is created.
init.dataset.3 <- function()
{
  log.out.data.server()
  if (ds.test_env$secure_login_details)
  {
    ds.test_env$local.values.3 <- read.csv("data_files/DATASET3.csv", header = TRUE)
    if (ds.test_env$driver == "OpalDriver")
    {
      ds.test_env$server <- c("study3")
      ds.test_env$url <- c(ds.test_env$ip_address_3)
      ds.test_env$user <- c(ds.test_env$user_3)
      ds.test_env$password <- c(ds.test_env$password_3)
      ds.test_env$table <- c("TESTING.DATASET3")
      ds.test_env$login.data <- datashield.build.login.data.frame.o(ds.test_env$server,
                                                                    ds.test_env$url,
                                                                    ds.test_env$table,
                                                                    ds.test_env$user,
                                                                    ds.test_env$password,
                                                                    .silent = TRUE)
    }
    else
    {
      login.data <- DSLite::setupDATASETTest("dsBase", env = ds.test_env)
      ds.test_env$login.data <- subset(login.data, server=="study3")
    }
    ds.test_env$stats.var <- list('ID','CHARACTER', 'LOGICAL','NA_VALUES','INTEGER','NULL_VALUES',
                                  'NON_NEGATIVE_INTEGER','POSITIVE_INTEGER','NEGATIVE_INTEGER',
                                  'NUMERIC', 'NON_NEGATIVE_NUMERIC','POSITIVE_NUMERIC','NEGATIVE_NUMERIC','FACTOR_CHARACTER', 
                                  'FACTOR_INTEGER','IDENTIFIER','CATEGORY','IDENTIFIER','CATEGORY')
  }
}

# Connect to one server and the three datasets. One local variables named ds.test_env$local.values.2 is created.
init.dataset.2 <- function()
{
  log.out.data.server()
  if (ds.test_env$secure_login_details)
  {
    ds.test_env$local.values.2 <- read.csv("data_files/DATASET2.csv", header = TRUE)
    if (ds.test_env$driver == "OpalDriver")
    {
      ds.test_env$server <- c("study2")
      ds.test_env$url <- c(ds.test_env$ip_address_2)
      ds.test_env$user <- c(ds.test_env$user_2)
      ds.test_env$password <- c(ds.test_env$password_2)
      ds.test_env$table <- c("TESTING.DATASET2")
      ds.test_env$login.data <- datashield.build.login.data.frame.o(ds.test_env$server,
                                                                    ds.test_env$url,
                                                                    ds.test_env$table,
                                                                    ds.test_env$user,
                                                                    ds.test_env$password,
                                                                    .silent = TRUE)
    }
    else
    {
      login.data <- DSLite::setupDATASETTest("dsBase", env = ds.test_env)
      ds.test_env$login.data <- subset(login.data, server=="study2")
    } 
    ds.test_env$stats.var <- list('ID','CHARACTER', 'LOGICAL','NA_VALUES','INTEGER','NULL_VALUES',
                                  'NON_NEGATIVE_INTEGER','POSITIVE_INTEGER','NEGATIVE_INTEGER',
                                  'NUMERIC', 'NON_NEGATIVE_NUMERIC','POSITIVE_NUMERIC','NEGATIVE_NUMERIC','FACTOR_CHARACTER', 
                                  'FACTOR_INTEGER','IDENTIFIER','CATEGORY','IDENTIFIER','CATEGORY')
  }
}

# Connect to one server and the three datasets. One local variables named ds.test_env$local.values.2is created.
init.dataset.1 <- function()
{
  log.out.data.server()
  if (ds.test_env$secure_login_details)
  {
    ds.test_env$local.values.1 <- read.csv("data_files/DATASET1.csv", header = TRUE)
    if (ds.test_env$driver == "OpalDriver")
    {
      ds.test_env$server <- c("study1")
      ds.test_env$url <- c(ds.test_env$ip_address_1)
      ds.test_env$user <- c(ds.test_env$user_1)
      ds.test_env$password <- c(ds.test_env$password_1)
      ds.test_env$table <- c("TESTING.DATASET1")
      ds.test_env$login.data <- datashield.build.login.data.frame.o(ds.test_env$server,
                                                                    ds.test_env$url,
                                                                    ds.test_env$table,
                                                                    ds.test_env$user,
                                                                    ds.test_env$password,
                                                                    .silent = TRUE)
    }
    else
    {
      login.data <- DSLite::setupDATASETTest("dsBase", env = ds.test_env)
      ds.test_env$login.data <- subset(login.data, server=="study1")
    }  
    ds.test_env$stats.var <- list('ID','CHARACTER', 'LOGICAL','NA_VALUES','INTEGER','NULL_VALUES',
                                  'NON_NEGATIVE_INTEGER','POSITIVE_INTEGER','NEGATIVE_INTEGER',
                                  'NUMERIC', 'NON_NEGATIVE_NUMERIC','POSITIVE_NUMERIC','NEGATIVE_NUMERIC','FACTOR_CHARACTER', 
                                  'FACTOR_INTEGER','IDENTIFIER','CATEGORY','IDENTIFIER','CATEGORY')
  }
}

log.in.data.server <- function()
{
  ds.test_env$connections <- datashield.login(logins=ds.test_env$login.data, assign=TRUE,variables=ds.test_env$stats.var)
}


log.out.data.server <- function(connections= NULL)
{
  if (!is.null(connections))
  {
    datashield.logout(connections)
  }
  rm(list = ls())
  gc()
}

connect.all.datasets <- function()
{
  source("connection_to_datasets/login_details.R")
  init.all.datasets()
  log.in.data.server()
  return(ds.test_env$connections)
}

connect.dataset.1 <- function()
{
  source("connection_to_datasets/login_details.R")
  init.dataset.1()
  log.in.data.server()
  return(ds.test_env$connections)
}

connect.dataset.2 <- function()
{
  source("connection_to_datasets/login_details.R")
  init.dataset.2()
  log.in.data.server()
  return(ds.test_env$connections)
}

connect.dataset.3 <- function()
{
  source("connection_to_datasets/login_details.R")
  init.dataset.3()
  log.in.data.server()
  return(ds.test_env$connections)
}

disconnect.all.datasets <- function(connections)
{
  log.out.data.server(connections)
}

disconnect.dataset.1 <- function(connections)
{
  log.out.data.server(connections)
}

disconnect.dataset.2 <- function(connections)
{
  log.out.data.server(connections)
}

disconnect.dataset.3 <- function(connections)
{
  log.out.data.server(connections)
}
