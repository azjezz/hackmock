namespace Usox\HackMock;

use namespace HH\Lib\Str;
use namespace HH\Lib\SecureRandom;
use type ReflectionClass;
use function tempnam;
use function file_put_contents;
use function sys_get_temp_dir;

final class Mock<T> implements MockInterface<T> {

  public function __construct(
    private classname<T> $interface
  ): void {}

  public function build(): T {
    $reflection = new ReflectionClass($this->interface);

    $name = Str\format(
      'Mock%s_%s',
      $reflection->getShortName(),
      SecureRandom\string(32, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789')
    );

    $this->generate($reflection, $name)
      |> $this->eval($$);

    // UNSAFE
    return new $name();
  }

  private function generate(ReflectionClass $reflection, string $name): string {
    return new Mock\MockBuilder($reflection)
      |> $$->setName($name)->get()->render();
  }

  private function eval(string $code): void {
    $file = tempnam(
      sys_get_temp_dir(), __NAMESPACE__ . __CLASS__ . __METHOD__
    ) . '.hack';
    file_put_contents($file, $code);
    require_once $file;
  }
}
