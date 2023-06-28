resource "elastic-siem-detection_detection_rule" "my_rules" {
  rule_content = jsonencode(
    {
      "rule_id" : "hacker_rule",
      "enabled" : true,
      "description" : "This rule catches a hacker.\n",
      "language" : "kuery",
      "name" : "Rule to catch a hacker\n",
      "query" : "user.name: \"hacker\"\n",
      "risk_score" : 21,
      "severity" : "low",
      "type" : "query",
      "author" : [
        "John Doe"
      ],
      "false_positives" : [
        "A user might not be a hacker."
      ],
      "license" : "My License\n",
      "tags" : [
        "MyTag"
      ],
      "interval" : "20m",
      "from" : "now-10m",
      "index" : [
        "myindex-*"
      ],
      "threat" : [
        {
          "framework" : "MITRE ATT&CK",
          "tactic" : {
            "id" : "TA001",
            "name" : "Initial Access",
            "reference" : "https://attack.mitre.org/tactics/TA0001/"
          },
          "technique" : [
            {
              "id" : "T1133",
              "name" : "External Remote Services",
              "reference" : "https://attack.mitre.org/techniques/T1133/"
            }
          ]
        }
      ],
      "exceptions_list" : [
        {
          "list_id" : "hacker",
          "id" : "<GENERATED_LIST_ID>",
          "namespace_type" : "single",
          "type" : "detection"
        }
      ],
      "max_signals" : 100
    }
  )

  # Helps syncing between objects
  depends_on = [elastic-siem_exception_container.my_containers]
}