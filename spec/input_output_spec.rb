require "spec_helper"

module TicTacToe
  describe InputOutput do
    let(:io) {InputOutput.new}

    describe "#input" do
      it "can get input" do
        allow(io).to receive(:gets) {"1"}
        expect(io.input).to eq "1"
      end
    end

    describe "#output" do
      it "can output data" do
        allow(io).to receive(:puts) {"1"}
        expect(io.output("1")).to eq "1"
      end
    end
  end
end