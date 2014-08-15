require "spec_helper"

module TicTacToe
  describe Player do
    context "when its value is X" do
      let(:player) {Player.new('X')}

      describe "#to_s" do
        it "should be X" do
          expect("#{player}").to eq "X"
        end
      end
    end
  end
end