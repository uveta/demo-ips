targetScope = 'resourceGroup'

param location string = resourceGroup().location
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param sku string = 'Standard_LRS'
param name string = 'stoipsbicepdemo'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  kind: 'StorageV2'
}
