---
name: go-unit-test-writing
description: Applies when creating, updating, or reviewing Go unit tests with idiomatic table-driven patterns and PascalCase case names. Use this skill for requests like "write Go unit tests", "add tests for this Go function", "refactor Go tests", "convert to table-driven tests", "use map[string]struct{}", or "add t.Run subtests"; 
---

## Test Cases

- Prefer adding new cases to existing test functions when possible, rather than creating a new test function.

- Write table-driven tests using `map[string]struct{...}`.
   - Use the map key as the test case name.
   - Store all inputs, expected outputs, and expected errors in the struct value.

   ```go
   testCases := map[string]struct {
       payload      string
       wantResponse string
       wantErr      error
   }{
       "ValidPayload": {
           payload:      "...",
           wantResponse: "...",
           wantErr:      nil,
       },
   }

   for name, tc := range testCases {
       t.Run(name, func(t *testing.T) {
           // test logic
       })
   }
   ```

- Use `PascalCase` for test case names (for example: `ValidPayload`, `MissingUserID`, `UnexpectedEOF`).

## Coverage

- After writing tests, run `go test -coverprofile=cover.out ./...`.

- Review the coverage report and confirm the targeted code reaches at least 85% coverage when realistic.

- Prioritize meaningful, real-world scenarios. Do not add contrived test cases solely to inflate coverage.


