# snapshot-test-sample
Sample of Snap shot Test using https://github.com/uber/ios-snapshot-test-case

# What
Sample of inputting various data to multiple types of cells and taking screenshots with various devices.

e.g. 

[CellTest.swift](https://github.com/omuomugin/snapshot-test-sample/blob/master/snapshot-testTests/Cell/CellTest.swift)

is a test for cell which has title(max line is 2) and description (max line is 2).
this test can input long or short string and take screenshot automatically.

# How
See the [setting file](https://github.com/omuomugin/snapshot-test-sample/blob/master/snapshot.json) for this tool.
This setting file will produce the following command

```
# script for running screen shot test
ruby snap-shot-command.rb

# produced command
xcodebuild -workspace snapshot-test.xcworkspace \
-scheme snapshot-test \
-destination name="iPhone 8" \
-destination name="iPhone 8 Plus" \
-destination name="iPhone 11" \
-destination name="iPhone 11 Pro" \
-destination name="iPhone 11 Pro Max" \
-only-testing:snapshot-testTests/CellTest \
clean test
```

As a result you can see screen shots [here](https://github.com/omuomugin/snapshot-test-sample/tree/master/snapshot-testTests/ReferenceImages_64/snapshot_testTests.CellTest)
