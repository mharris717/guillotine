require File.dirname(__FILE__) + "/../spec_helper"

module Guillotine
  describe Expression do
    describe "Syntax classes" do
      it "should find the syntax class for the equal sign" do
        Expression.find_class_for("=").should == Expression::Equal
      end
      
      it "should find the syntax class for the not equal sign" do
        Expression.find_class_for("!=").should == Expression::NotEqual
      end
      
      it "should find the syntax class for the less than sign" do
        Expression.find_class_for("<").should == Expression::LessThan
      end
      
      it "should find the syntax class for the less than or equal sign" do
        Expression.find_class_for("<=").should == Expression::LessThanOrEqualTo
      end
      
      it "should find the syntax class for the greater than sign" do
        Expression.find_class_for(">").should == Expression::GreaterThan
      end
      
      it "should find the syntax class for the greater than or equal to sign" do
        Expression.find_class_for(">=").should == Expression::GreaterThanOrEqualTo
      end
      
      it "should find the syntax class for the IS NULL expression" do
        Expression.find_class_for("IS NULL").should == Expression::IsNull
      end
      
      it "should find the syntax class for the IS NOT NULL expression" do
        Expression.find_class_for("IS NOT NULL").should == Expression::IsNotNull
      end
      
      it "should find the syntax class for the AND expression" do
        Expression.find_class_for("AND").should == Guillotine::ConjunctionConditionNode
      end
      
      it "should find the syntax class for the OR than sign" do
        Expression.find_class_for("OR").should == Guillotine::DisjunctionConditionNode
      end
    end
  end
end