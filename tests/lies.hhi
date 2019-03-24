<?hh // strict

namespace HH {
  // Results in an \HH\InvariantException whose message is the result of
  // calling sprintf with the arguments given this function
  <<__Rx>>
  function invariant_violation(
    \HH\FormatString<PlainSprintf> $fmt,
    ...$fmt_args
  ): noreturn
  ;
}
