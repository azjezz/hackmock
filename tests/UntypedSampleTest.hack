use namespace Usox\HackMock;
use namespace Facebook\HackTest;
use function Usox\HackMock\mock;
use function Usox\HackMock\prospect;

class UntypedSampleTest extends HackTest\HackTest {
  use HackMock\HackMock;

  public function testUntypedParameter(): void {
    $sample = mock(Stub\UntypedSampleBaseClass::class);

    prospect($sample, 'untypedParameter')->execute(vec[]);
  }

  public function testUntypedDefaultParameter(): void {
    $sample = mock(Stub\UntypedSampleBaseClass::class);

    prospect($sample, 'untypedDefaultParameter')->execute(vec[]);
  }
}
