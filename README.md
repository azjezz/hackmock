[![Build Status](https://travis-ci.org/usox/hackmock.svg?branch=master)](https://travis-ci.org/usox/hackmock)

# HackMock

Creating mock objects for hacklang - yes, seriously.

## What works

- Strict mode
- Creating mocks of interfaces and concrete classes
- Defining basic method expectations (parameter validation, return value definition)

## What does not work

- Everything else, especially rare and/or untested cases involving generics, etc.

```hack
use namespace Facebook\HackTest;
use namespace Usox\HackMock;
use type Exception;

class SomethingTest extends HackTest\HackTest {
  use HackMock\HackMock;

  public function testSomething(): void {
    $mock = HackMock\mock(SomeInterface::class);

    HackMock\prospect($mock, 'someMethodName')
      ->once()
      ->andReturn('some-fine-value');
    HackMock\prospect($object, 'someOtherMethodName')
      ->andThrow(new Exception('foobar'));

    ...
  }
}
```