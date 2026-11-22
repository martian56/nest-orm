# Changelog

## 0.3.1 - 2026-11-22

- Uses raven-mysql and raven-postgres 0.3.1, which report a plain error when the port is not a database server.
- The quick-start import is written in the parenthesized form; requires Raven 3.3.0 or newer for that example.

## 0.3.0 - 2026-11-21

- Ported to Raven 3 syntax; requires Raven 3.0.1 or newer.

## 0.2.0 - 2026-07-15

- Surface SQLite binding, execution, reading, finalization, and close failures.
- Discover SQLite result column labels for wildcard and raw queries.
- Preserve the logical behavior of empty `IN` and `NOT IN` predicates.
- Compile equality comparisons with SQL NULL as `IS NULL` and `IS NOT NULL`.
- Encode booleans portably for PostgreSQL, MySQL, and SQLite.
- Generate valid offset-only queries for every bundled dialect.
- Detect renamed or missing migrations that were already applied.
- Add a MySQL adapter mode for `NO_BACKSLASH_ESCAPES` sessions.
- Update all bundled database drivers to version 0.2.0.
- Expand Docker coverage for transactions, PostgreSQL `RETURNING`, adapter recovery,
  migration history, and MySQL SQL modes.
- Test PostgreSQL 16 and 17 combinations in CI.

## 0.1.0 - 2026-07-14

- Initial release.
