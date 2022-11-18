var location = 'westeurope'
var prefix = 'tomas1289'

// Azure Container Registry
resource acr 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: prefix
  location: location
  sku: {
    name: 'Basic'
  }
} 
