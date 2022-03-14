targetScope = 'subscription'
param location string = 'westeurope'
param deployStorage bool = false

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-demo'
  location: location
  tags: {}
}

module storage './v6_storageAccount.bicep' = if (deployStorage) {
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

module appService 'v6_appService.bicep' = {
  name: 'appService'
  scope: rg
  params: {
    storageConnectionString: storage.outputs.connectionString // deployStorage? storage.outputs.connectionString: ''
  }
}
