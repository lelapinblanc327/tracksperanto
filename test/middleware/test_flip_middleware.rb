require File.dirname(__FILE__) + '/../helper'

class FlipMiddlewareTest < Test::Unit::TestCase
  def test_shift_supports_hash_init
    receiver = flexmock
    
    m = Tracksperanto::Middleware::Flip.new(receiver)
    assert !m.enabled
    
    m = Tracksperanto::Middleware::Flip.new(receiver, :enabled => true)
    assert m.enabled
  end
  
  def test_export_flip_and_flop
    receiver = flexmock(:exporter)
    receiver.should_receive(:start_export).once.with(110, 120)
    receiver.should_receive(:export_point).once.with(1, 100, 95, 0)
    receiver.should_receive(:export_point).once.with(1, 10, 95, 0)
    
    m = Tracksperanto::Middleware::Flip.new(receiver, :enabled => true)
    m.start_export(110, 120)
    m.export_point(1, 10, 95, 0)
    m.enabled = false
    m.export_point(1, 10, 95, 0)
  end
end