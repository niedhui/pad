class Monster
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter


  columns :image               => :string,
          :image100            => :string,
          :image40             => :string,
          :name_jp             => :string,
          :name                => :string,
          :number              => :string,
          :rarity              => :string,

          :cost                => :string,
          :main_attr           => :string,
          :sub_attr            => :string,
          :monster_type        => :string,
          :series              => :string,

          :exp_curve           => :string,
          :max_exp             => :string,
          :fuse_exp            => :string,
          :lv1_value           => :string,

          :initial_lv          => :string,
          :hp                  => :string,
          :atk                 => :string,
          :rcv                 => :string,
          :weighted_stat       => :string,

          :max_lv              => :string,
          :final_hp            => :string,
          :final_atk           => :string,
          :final_rcv           => :string,
          :final_wt_stat       => :string,


          :skill_name          => :string,
          :skill_image         => :string,
          :initial_cooldown    => :string,
          :min_cooldown        => :string,
          :skill_effect        => :string,
          :leader_skill_name   => :string,
          :leader_skill_image  => :string,
          :leader_skill_effect => :string,


          :pal_egg_machine     => :string,
          :rare_egg_machine    => :string,
          :other_obtain        => :string,
          :dungeon_drop        => :string,

          :evolution           => :string,
          :ultimate_evolution  => :string,

          :evo_used_by         => :string

  def shown_columns
    [:number, :name]
  end
end
