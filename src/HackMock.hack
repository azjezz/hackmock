namespace Usox\HackMock;

use type Facebook\HackTest\HackTest;

trait HackMock {
  require extends HackTest;

  <<__Override>>
  public async function afterEachTestAsync(): Awaitable<void> {
    tear_down();
  }
}
