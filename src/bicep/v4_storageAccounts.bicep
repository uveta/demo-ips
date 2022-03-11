targetScope = 'resourceGroup'

param location string = resourceGroup().location
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param sku string = 'Standard_LRS'
param name string = 'stoipsbicepdemo'
param count int

resource storages 'Microsoft.Storage/storageAccounts@2021-08-01' = [for i in range(1, count): {
  name: '${name}${i}'
  location: location
  sku: {
    name: sku
  }
  kind: 'StorageV2'
}]
