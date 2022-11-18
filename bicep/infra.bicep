var location = resourceGroup().location
var name = uniqueString(resourceGroup().id)

// Azure Container Registry
resource acr 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: name
  location: location
  sku: {
    name: 'Basic'
  }
} 
