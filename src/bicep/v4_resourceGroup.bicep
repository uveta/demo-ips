targetScope = 'subscription'
param location string = 'westeurope'
param deployStorage bool = false

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-demo'
  location: location
  tags: {}
}

module storages './v4_storageAccounts.bicep' = if (deployStorage) {
  name: 'storage'
  scope: rg
  params: {
    location: rg.location
    sku: 'Standard_LRS'
    name: 'stoipsbicepdemo'
    count: 4
  }
}
