require_relative 'spec_helper.rb'
require 'docking_station'
DEFAULT_CAPACITY = DockingStation::DEFAULT_CAPACITY


describe DockingStation do
	let(:bike) {double :bike}

	it { is_expected.to respond_to :release_bike }
	describe '#release_bike' do
		it 'release bike' do
			allow(bike).to receive(:working)
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises error when there are no bikes' do
			expect { subject.release_bike }.to raise_error 'No bikes available!'
		end
	end

	describe '#dock' do
		it 'raises an error when full' do
			subject.capacity.times{subject.dock double(:bike)}
			expect {subject.dock double(:bike)}.to raise_error 'Docking station full!'
		end
	end

	it 'is bike docked' do
		bike = double(:bike)
		expect(subject.dock(bike)).to eq subject.bikes
	end

	it 'docking station full' do
		subject.capacity.times{subject.dock double(:bike)}
		expect(subject.capacity).to eq DEFAULT_CAPACITY
	end

	it 'test user set docking capacity' do
		station = DockingStation.new(10)
		expect(station.capacity).to eq 10
	end


  #let(:bike) { Bike.new }

  it 'defaults to default_capacity if no capacity is passed' do
		bike = double(:bike)
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full!'
  end

	it 'broken bike not released' do

		allow(bike).to receive(:working).and_return(false)
		subject.dock(bike)
		expect{subject.release_bike}.to raise_error 'Bike is broken'
	end



end
