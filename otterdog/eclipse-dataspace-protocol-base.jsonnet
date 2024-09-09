local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-dataspace-protocol-base') {
  settings+: {
    description: "",
    name: "Eclipse Dataspace Protocol",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('DataspaceProtocol') {
      allow_merge_commit: true,
      allow_update_branch: true,
      delete_branch_on_merge: false,
      description: "The Dataspace Protocol is a set of specifications designed to facilitate interoperable data sharing between entities governed by usage control and based on Web technologies. These specifications define the schemas and protocols required for entities to publish data, negotiate Agreements, and access data in a data space ",
      gh_pages_build_type: "workflow",
      has_discussions: true,
      has_issues: true,
      homepage: "https://eclipse.dev/dataspace-protocol-base",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_pull_request: true,
          requires_status_checks: true,
        },
      ],      
    },
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Dataspace Protocol Base website",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('dsp_best_practices') {
      allow_merge_commit: true,
      allow_update_branch: true,
      delete_branch_on_merge: false,
      description: "Best Practices in conjunction with the usage and development of the Dataspace Protocol",
      has_discussions: true,
      has_issues: true,
      homepage: "https://eclipse.dev/dataspace-protocol-base",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_pull_request: true,
          requires_status_checks: true,
        },
      ],
    },
  ],
}
