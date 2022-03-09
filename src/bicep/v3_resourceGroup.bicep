targetScope = 'subscription'
param location string = 'westeurope'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-demo'
  location: location
  tags: {}
}

module storage './v2_storageAccount.bicep' = {
  name: 'storage'
  scope: rg
  params: {
    location: rg.location
    sku: 'Standard_LRS'
    name: 'stoipsbicepdemo1'
  }
}
