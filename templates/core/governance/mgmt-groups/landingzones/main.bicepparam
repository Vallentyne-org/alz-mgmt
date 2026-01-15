using './main.bicep'

// General Parameters
param parLocations = [
  '<region-1>'
  '<region-2>'
]
param parEnableTelemetry = true

param landingZonesConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'landingzones'
  managementGroupParentId: 'alz'
  managementGroupIntermediateRootName: 'alz'
  managementGroupDisplayName: 'Landing zones'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  'Enable-DDoS-VNET': {
    parameters: {
      ddosPlan: {
        value: '/subscriptions/c37aa506-459c-4864-8f24-b4cb96172042/resourceGroups/rg-alz-conn-${parLocations[0]}/providers/Microsoft.Network/ddosProtectionPlans/ddos-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-AzSqlDb-Auditing': {
    parameters: {
      logAnalyticsWorkspaceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmArc-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-ChangeTrack': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-changetracking-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-vmHybr-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
    }
  }
  'Deploy-VM-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-VMSS-Monitoring': {
    parameters: {
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-vminsights-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
  'Deploy-MDFC-DefSQL-AMA': {
    parameters: {
      userWorkspaceResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.OperationalInsights/workspaces/log-alz-${parLocations[0]}'
      }
      dcrResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.Insights/dataCollectionRules/dcr-alz-mdfcsql-${parLocations[0]}'
      }
      userAssignedIdentityResourceId: {
        value: '/subscriptions/cb0564c2-0f1c-4b7a-a4fd-8462c6a9f9b0/resourceGroups/rg-alz-logging-${parLocations[0]}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uami-alz-${parLocations[0]}'
      }
    }
  }
}
