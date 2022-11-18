param name string 
var location = resourceGroup().location

// Azure Container Registry
resource acr 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: name
  location: location
  sku: {
    name: 'Basic'
  }
}

// Azure Container Apps Environment
resource cenv 'Microsoft.App/managedEnvironments@2022-03-01' = {
  name: name
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: logs.properties.customerId
        sharedKey: listKeys(logs.id, logs.apiVersion).primarySharedKey
      }
    }
  }
}

// Log Analytics workspace
resource logs 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: name
  location: location
  sku: {
    name: 'PerGB2018'
  }
}

output name string = name
output rg string = resourceGroup().name
