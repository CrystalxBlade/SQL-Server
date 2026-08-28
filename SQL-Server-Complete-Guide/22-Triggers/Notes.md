# Triggers

A trigger is SQL code that **automatically runs when a specified database event occurs**.

Common events:
- `INSERT`
- `UPDATE`
- `DELETE`

## Why use triggers?
For example, you might automatically record changes to important data in an audit table.

Triggers should be used carefully because they execute automatically as part of another operation, which can make database behavior harder to follow.

## Basic idea
```text
INSERT happens
      ↓
Trigger fires automatically
      ↓
Trigger performs its defined action
```
