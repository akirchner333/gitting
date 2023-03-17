defmodule Gitting do
  def commit_names do
    verbs = ~w(Reconfigured Fixed Expanded Rebuilt Built Configured Ate Removed Added Trimmed Streamlined Customized Commented Documented Optimized Deoptimized Summoned Hid Revealed Checked Improved Broke Refactored Released Hunted Killed Cursed)
    nouns = ~w(objects code database modulator converter blood module guards functions lists keywords atoms strings whitespace docs games eyes thought awakening erlang c++ ruby javascript zombie unicorn git)
    ["#{Enum.random(verbs)} the #{Enum.random(nouns)}"]
  end

  def each(n) do
    date = ~D[2018-04-28] |> Date.add(n) |> Date.to_string
    System.cmd("git", ~w(commit --allow-empty --date=#{date} -m) ++ Gitting.commit_names)
  end
end

Enum.each(0..365, fn x -> Gitting.each(x) end)