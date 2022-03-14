targetScope = 'resourceGroup'

param location string = resourceGroup().location
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param sku string = 'Standard_LRS'
param name string = 'stoipsbicepdemo'
param containers array = []

resource sto 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  kind: 'StorageV2'

  resource blobService 'blobServices' = {
    name: 'default'
    properties: {
      isVersioningEnabled: true
      changeFeed: {
        enabled: true
      }
    }

    resource _ 'containers' = [for container in containers: {
      name: '${container}' // container
      properties: {
        publicAccess: 'None'
      }
    }]
  }
}
