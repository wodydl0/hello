// add parameters for name and location that defaults to the resourcegroup's location
param name string
param location string = resourceGroup().location

resource asplan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'asplan-$(name)'
  location: location
}

resource appsvc 'Microsoft.Web/sites@2021-02-01' = {
  name: 'appsvc-$(name)'
  location: location
  properties: {
    serverFarmId: asplan.id
  }
}
