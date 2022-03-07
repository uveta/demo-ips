targetScope = 'resourceGroup'

resource sto 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'stobicepdemo'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
