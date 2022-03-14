targetScope = 'subscription'
param location string = 'westeurope'
param deployStorage bool = false

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-demo'
  location: location
  tags: {}
}

module storage './v5_storageAccount.bicep' = if (deployStorage) {
  name: 'storage'
  scope: rg
  params: {
    location: rg.location
    sku: 'Standard_LRS'
    name: 'stoipsbicepdemo'
    containers: [
      'logs'
      'sessions'
      'assets'
    ]
  }
}
