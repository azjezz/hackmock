namespace Usox\HackMock;

interface MockInterface<T> {
  public function build(): T;
}
