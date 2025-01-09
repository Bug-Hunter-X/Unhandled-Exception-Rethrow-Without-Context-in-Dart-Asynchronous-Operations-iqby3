# Unhandled Exception Rethrow Without Context in Dart

This repository demonstrates a common error in Dart asynchronous programming: rethrowing exceptions without adding context. The `bug.dart` file contains code with this issue.  The `bugSolution.dart` file provides an improved approach.

## Problem:
The original code uses a `try-catch` block to handle network request errors. However, simply rethrowing the exception loses valuable information about where the error initially occurred.  Debugging becomes harder as stack traces are not as informative.

## Solution:
The solution involves wrapping the original exception in a custom exception, providing additional details such as the request URL and HTTP status code.