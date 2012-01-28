# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__)) + '/../helper'

class MayaLocatorsExportTest < Test::Unit::TestCase
  include ParabolicTracks
  
  P_LOCATORS = File.dirname(__FILE__) + "/samples/ref_MayaLocators.mel"
  
  def test_export_output_written
    ensure_same_output Tracksperanto::Export::MayaLocators, P_LOCATORS
  end
  
  def test_exporter_meta
    assert_equal "mayaLocators.mel", Tracksperanto::Export::MayaLocators.desc_and_extension
    assert_equal "Maya .mel script that generates locators", Tracksperanto::Export::MayaLocators.human_name
  end
end