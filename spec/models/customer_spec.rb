require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:customer, name: 'Victor Policastro')

    expect(customer.full_name).to(start_with('Sr. Victor Policastro'))
  end

  it 'herança' do
    customer = create(:customer_vip)

    expect(customer.vip).to(eq(true))
    expect(customer.days_to_pay).to(eq(30))
  end

  it '#full_name' do
    customer = create(:user) # ou create(:customer)

    expect(customer.full_name).to(start_with('Sr. '))
  end

  it 'attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)

    expect(customer.full_name).to(start_with('Sr. '))
  end

  it 'Atributo Transitorio' do
    customer =  create(:customer_default, upcased: true)

    expect(customer.name.upcase).to(eq(customer.name))
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)

    expect(customer.gender).to(eq('F'))
  end

  it 'Cliente Feminino Vip' do
    customer = create(:customer_female_vip)

    expect(customer.gender).to(eq('F'))
    expect(customer.vip).to(be(true))
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)

    expect(customer.gender).to(eq('M'))
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to(be < Time.now)
  end

  it { expect { create(:customer) }.to change { Customer.count }.by(1)  }
end
