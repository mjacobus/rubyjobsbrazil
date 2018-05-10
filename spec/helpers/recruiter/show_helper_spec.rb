# frozen_string_literal: true

require 'rails_helper'

module Recruiter
  describe ShowHelper, type: :helper do
    describe 'AttributeShower' do
      describe '#show' do
        it 'calls render with the correct params' do
          object  = User.new(name: 'Some Name')
          subject = Recruiter::ShowHelper::AttributeShower.new(object, helper)

          expect(User).to receive(:human_attribute_name).with(:name).and_return('Nome')
          expect(subject).to receive(:render).with('Nome', 'Some Name')

          subject.show(:name)
        end
      end

      describe '#render' do
        it 'renders the correct partial with the correct params' do
          object = double(:object)
          helper = double(:helper)
          subject = Recruiter::ShowHelper::AttributeShower.new(object, helper)
          expect(helper).to receive(:render).with('application/show_item',
                                                  label: 'label', value: 'value')

          subject.render('label', 'value')
        end
      end
    end

    describe '#show_for' do
      it 'instantiates the AttributeShower and display the correct params' do
        shower = double(:shower)
        object = User.make

        expect(Recruiter::ShowHelper::AttributeShower).to receive(:new).and_return(shower)
          .with(object, helper).and_return(shower)

        expect(shower).to receive(:show).with(:email)

        helper.show_for(object) do |shower|
          shower.show(:email)
        end
      end
    end
  end
end
