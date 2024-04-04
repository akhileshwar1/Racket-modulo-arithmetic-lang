# Modulo Arithmetic Language

## Abstract

This language facilitates operations in modulo arithmetic using a Lisp-like syntax, emphasizing a prefix (pre-operator) notation.

## Rules of Evaluation

The language adheres to the following rules for evaluation in the context of modulo arithmetic:

1. Every number is considered as a number modulo `n`.
2. The result of any operator can be trimmed down in the ring by modulo `n`.

Alternatively, it can be understood as:

1. Every number, whether standalone or as a result, must be within the ring defined by modulo `n`.

## Grammar

The grammar of the language is outlined as follows:

### Defining Modulo

- **Syntax**: `(mod n x) -> (define n x)`
- **Description**: Defines `n` as the modulo for subsequent operations.

### Integer Operation

- **Syntax**: `(Z int) -> int/n`
- **Description**: Represents an integer operation within the modulo `n` ring.

### Operator Definition

- **Syntax**: `(Z operator)`
- **Description**: Defines an operator macro that performs the standard operation, followed by the modulo `n` operation as the last step.
