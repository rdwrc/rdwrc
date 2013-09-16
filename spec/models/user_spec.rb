require_relative '../spec_helper'
require 'cancan/matchers'

describe User do

  describe 'as super admin' do
    subject { FactoryGirl.create :super_admin }

    it 'should have correct super admin privileges' do
      subject.admin?.should be_true
      subject.editor?.should be_true
      subject.author?.should be_true
      subject.contributor?.should be_true
    end

    it 'should be able to manage any article' do
      article = Article.new
      article.user = subject

      ability = Ability.new(subject)
      ability.should be_able_to(:manage, article)
    end
  end

  describe 'as admin' do
    subject { FactoryGirl.create :admin }

    it 'should have correct admin privileges' do
      subject.admin?.should be_true
      subject.editor?.should be_false
      subject.author?.should be_false
      subject.contributor?.should be_false
    end

    it 'should be able to manage any article' do
      article = Article.new
      article.user = subject

      ability = Ability.new(subject)
      ability.should be_able_to(:manage, article)
    end
  end

  describe 'as editor' do
    subject { FactoryGirl.create :editor }

    it 'should have correct editor privileges' do
      subject.admin?.should be_false
      subject.editor?.should be_true
      subject.author?.should be_false
      subject.contributor?.should be_false
    end

    it 'should be able to manage any article' do
      article = Article.new
      article.user = subject

      ability = Ability.new(subject)
      ability.should be_able_to(:manage, article)
    end
  end

  describe 'as author' do
    subject { FactoryGirl.create :author }

    it 'should have correct author privileges' do
      subject.admin?.should be_false
      subject.editor?.should be_false
      subject.author?.should be_true
      subject.contributor?.should be_false
    end

    it 'should be able to manage their own article' do
      article = Article.new
      article.user = subject

      ability = Ability.new(subject)
      ability.should be_able_to(:manage, article)
    end

    it 'should not be able to do anything to article owned by someone else' do
      article = Article.new
      article.user = FactoryGirl.create :editor

      ability = Ability.new(subject)
      ability.should_not be_able_to(:manage, article)
    end
  end

  describe 'as contributor' do
    subject { FactoryGirl.create :contributor }

    it 'should have correct contributor privileges' do
      subject.admin?.should be_false
      subject.editor?.should be_false
      subject.author?.should be_false
      subject.contributor?.should be_true
    end

    it 'should be able to manage their own article' do
      article = Article.new
      article.user = subject

      ability = Ability.new(subject)
      ability.should be_able_to(:create, article)
      ability.should be_able_to(:read, article)
      ability.should be_able_to(:update, article)
    end

    it 'should not be able to do anything to article owned by someone else' do
      article = Article.new
      article.user = FactoryGirl.create :editor

      ability = Ability.new(subject)
      ability.should_not be_able_to(:manage, article)
    end
  end

  describe 'as normal user' do
    subject { FactoryGirl.create :normal_user }

    it 'should have no special privileges' do
      subject.admin?.should be_false
      subject.editor?.should be_false
      subject.author?.should be_false
      subject.contributor?.should be_false
    end

    it 'should be able to read any article but not update or destroy any article' do
      article = Article.new
      article.user = FactoryGirl.create :author

      ability = Ability.new(subject)
      ability.should be_able_to(:read, article)
      ability.should_not be_able_to(:manage, article)
    end
  end

end
