# Changelog

## 0.5.2 - 2026-11-23

- Requires raven-postgres 0.4.0, which caches parameterized queries as prepared statements per connection. Every Postgres query Nest runs is parameterized, so repeated queries now skip parsing and can use a generic plan.

## 0.5.1 - 2026-11-23

- A migration's `up` and `down` SQL may hold several statements. They are split at top-level semicolons (quotes, comments, and `$$` bodies are respected) and run one by one; PostgreSQL rejected several commands in one prepared statement.
- `begin`, `transaction`, `migrate`, and `rollback_last` refuse a pool, which would have run BEGIN on one connection and the statements on another. Use `pool.transaction`, `pool.with`, or the new `pool.migrate`. Adapters gain `Executor.spreads_connections()` (default false).

## 0.5.0 - 2026-11-23

- Aggregates (`count_as`, `sum_as`, `avg_as`, `min_as`, `max_as`), `distinct`, and `group_by` on selects.
- Row locks: `for_update`, `for_update_skip_locked`, `for_update_nowait`, and `for_share`.
- `where_ilike`, `where_raw` and `or_where_raw` with bound `?` values, and `page(page, per_page)`.
- Upserts with `on_conflict_do_nothing` and `on_conflict_update`; `increment` and `decrement` on updates; `returning` on updates and deletes.
- More conditions on updates and deletes (`where_in`, `where_gt`, `where_raw`, and others).
- `fetch_models`, `fetch_one`, `count`, and `exists`.

## 0.4.0 - 2026-11-23

- `pool(max_size, connect)` from `nest-orm/pool`: a connection pool shared between goroutines. It is an `Executor`, adds `with` and `transaction` on one connection, and replaces a connection whose session ended (network errors, Postgres `FATAL`) while keeping it after an ordinary SQL error.
- `Executor` gains `close()` and `reusable_after(error)`, both with defaults. The adapters' `close` methods moved into their `Executor` impls.

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
