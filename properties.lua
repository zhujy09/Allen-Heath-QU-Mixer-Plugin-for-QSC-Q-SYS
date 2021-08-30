table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "None"
})
table.insert(props, {
  Name = "Model", 
  Type = "enum", 
  --Choices = {"Qu-16", "Qu-24", "Qu-32", "Qu-SB", "Qu-Pac"}, Value = "Qu-32"
  Choices = {"Qu-32", "Other"}, Value = "Qu-32"
})
