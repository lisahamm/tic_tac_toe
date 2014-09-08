require "spec_helper"

module TicTacToe
  describe InputOutput do
    let(:io) {InputOutput.new}

    describe "#input" do
      it "can get input" do
        allow(io).to receive(:gets) {"some string"}
        expect(io.input).to eq("some string")
      end
    end

    describe "#output" do
      it "outputs to the screen" do
        allow($stdout).to receive(:puts).with("some string")
        io.output("some string")
      end
    end
  end
end