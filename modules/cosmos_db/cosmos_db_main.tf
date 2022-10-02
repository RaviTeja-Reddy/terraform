resource "random_integer" "ri" {
    min = 10000
    max = 99999
  
}
resource "azurerm_cosmosdb_account" "cdb" {
    name = var.cosmos_db_name
    location = var.location
    resource_group_name = var.resource_group_name
    offer_type = "Standard"
    kind = "MongoDB"  
    enable_automatic_failover = true

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "eastus"
    failover_priority = 1
  }

  geo_location {
    location          = "uksouth"
    failover_priority = 0
  }
}