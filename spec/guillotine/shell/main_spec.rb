require File.dirname(__FILE__) + "/../../spec_helper"

module Guillotine
  module Shell
    describe Main do
      before(:each) do
        Main.stub!(:loop).and_yield
        Kernel.stub!(:puts)
        Readline.stub!(:readline).and_return "input"
        Command.stub!(:execute).and_return "some output"
      end
      
      describe "do" do
        before(:each) do
          Main.stub!(:output_error).and_return "error output"
        end
        
        it "should have some introductory text" do
          Main::INTRODUCTORY_TEXT.should =~ /Welcome to Guillotine SQL/m
        end
        
        it "should output the introduction text" do
          Kernel.should_receive(:puts).with(Main::INTRODUCTORY_TEXT)
          Main.do
        end
        
        it "should loop infinitely" do
          Main.should_receive(:loop).with(no_args).and_yield
          Main.do
        end
        
        it "should print out '>> ' with readline, and save the history" do
          Readline.should_receive(:readline).with(">> ", true).and_return "input"
          Main.do
        end
        
        it "should chomp any \n's off the end of the input" do
          Readline.stub!(:readline).and_return "exit\n"
          Command.should_receive(:execute).with("exit")
          Main.do
        end
        
        it "should send the input to Command.execute" do
          Command.should_receive(:execute).with("input")
          Main.do
        end
        
        it "should rescue any Runtime Error" do
          Command.stub!(:execute).and_raise(RuntimeError)
          lambda { 
            Main.do
          }.should_not raise_error
        end
        
        it "should output the error" do
          error = RuntimeError.new("an error occurred")
          Command.stub!(:execute).and_raise(error)
          
          Main.should_receive(:output_error).with(error)
          Main.do
        end
      end
      
      describe "outputting an error" do
        before(:each) do
          @error = mock 'an error', :message => "the message"
          Kernel.stub!(:puts).and_return "some output"
        end
        
        it "should call the error's message" do
          @error.should_receive(:message).with(no_args).and_return "some message"
          Main.output_error(@error)
        end
        
        it "should output the message on the error" do
          Kernel.should_receive(:puts).with("the message").and_return "some message"
          Main.output_error(@error)
        end
      end
      
      describe "emacs editing mode" do
        it "should be on" do
          pending 'Waiting on ruby 1.9' do
            # Emacs editing mode is disabled on OS X.5?
            Readline.emacs_editing_mode?.should be_true
          end
        end
      end
    end
  end
end
