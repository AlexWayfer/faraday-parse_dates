# Changelog

## Unreleased

## 1.1.0 (2026-11-10)

*   Drop Ruby 3.2 support (end of life).
*   Update Faraday dependency to 2.15.
*   Update development dependencies and Toys configuration.
*   Migrate CI from Cirrus CI to GitHub Actions.
*   Publish tagged gem releases through GitHub Actions.
*   Authenticate Codecov uploads with GitHub OIDC.
*   Replace the Code Climate badge with Qlty maintainability.
*   Remove the broken Inch CI badge.

## 1.0.0 (2026-02-09)

*   Drop Ruby 2.5, 2.6, 2.7, 3.0 and 3.1 support.
*   Add Ruby 3.2, 3.3, 3.4 and 4.0 support.
*   Improve README about middlewares order.
*   Update Faraday dependency.
*   Lock Faraday version more strict
    They're dropping Ruby versions in minor releases, and there can be other breaking changes.
*   Update development dependencies.
*   Resolve new RuboCop offenses.
*   Improve CI config.

## 0.1.1 (2022-07-23)

*   Enable `faraday.response :parse_dates`.
*   Clarify the case about `faraday.use`.

## 0.1.0 (2022-07-23)

*   Initial release.
