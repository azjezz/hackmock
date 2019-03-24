namespace Stub;

use function HH\invariant_violation;

class SampleBaseClass {
	public function __construct(): void { invariant_violation('Should never be constructed.'); }
	public function noParamsAndVoid(): void {}
	public function intParamAndReturnsInt(int $foo): int { return $foo; }
	public function intOrNullWithDefault(?int $foo = null): void {}
	public static function someStaticFunction(): void {}
	public static async function someStaticAsyncFunction(): Awaitable<void> {}
	public async function someAsyncFunction(num $bar): Awaitable<num> {
		return $bar + 2;
	}
}