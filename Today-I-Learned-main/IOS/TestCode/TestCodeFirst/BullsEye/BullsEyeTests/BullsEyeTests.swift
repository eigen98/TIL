

import XCTest
@testable import BullsEye

// swiftlint:disable implicitly_unwrapped_optional
class BullsEyeTests: XCTestCase {
  var sut: BullsEyeGame!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = BullsEyeGame()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testScoreIsComputedWhenGuessIsHigherThanTarget() {
    // 1. given
    let guess = sut.targetValue + 5

    // 2. when
    sut.check(guess: guess)

    // 3. then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }

  func testScoreIsComputedWhenGuessIsLowerThanTarget() {
    // 1. given
    let guess = sut.targetValue - 5

    // 2. when
    sut.check(guess: guess)

    // 3. then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }

  func testScoreIsComputedPerformance() {
    measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTStorageMetric(), XCTMemoryMetric()]) {
      sut.check(guess: 100)
    }
  }
}
