# require "spec_helper"

# module TicTacToe
#   describe Cell do
#     let(:cell) {Cell.new}
#     let(:marked_cell) {Cell.new('X')}


#     describe "#value" do
#       it "is the value" do
#         expect(marked_cell.value).to eq 'X'
#       end

#       it "sets the value" do
#         expect(cell.value = 'X').to eq 'X'
#       end
#     end

#     describe "#empty?" do
#       context "when its value is unassigned" do
#         it "is true" do
#           expect(cell.empty?).to eq true
#         end
#       end

#       context "when its value is assigned" do
#         it "is false" do
#           expect(marked_cell.empty?).to eq false
#         end
#       end
#     end

#     describe "#to_s" do
#       context "when empty" do
#         it "is a string containing a space" do
#           expect(cell.to_s).to eq ' '
#         end
#       end

#       context "when not empty" do
#         it "is its value" do
#           expect(marked_cell.to_s).to eq 'X'
#         end
#       end
#     end
#   end
# end