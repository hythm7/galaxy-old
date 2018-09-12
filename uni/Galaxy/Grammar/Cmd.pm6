#no precompilation;
#use Grammar::Tracer;

use Galaxy::Grammar::Xyz;

grammar Galaxy::Grammar::Cmd {
  also does Galaxy::Grammar::Xyz;

  proto token CMD { * } # ordere is important
  rule CMD:sym<gravity>   { <galaxy-laws>? <gravity>   <gravity-laws>?   <star>? <xyzs>   } # g
  rule CMD:sym<blackhole> { <galaxy-laws>? <blackhole> <blackhole-laws>? <star>? <xyzs>   } # b
  rule CMD:sym<spacetime> { <galaxy-laws>? <spacetime> <spacetime-laws>?         <event>? } # st
  rule CMD:sym<star>      { <galaxy-laws>? <star>      <star-laws>?              <xyzs>   } # s
  rule CMD:sym<galaxy>    { <galaxy-laws>?                               <star>? <xyz>?   } # g

	token galaxy    { 'galaxy' }
	token gravity   { 'gravity'            | 'g' }
	token blackhole { 'blackhole'          | 'b' }
	token spacetime { 'spacetime' | 'time' | 't' }
	token star      { 'star'               | 's' }

  token galaxy-laws    { <galaxy-law>+    % <space> } 
  token gravity-laws   { <gravity-law>+   % <space> }
  token blackhole-laws { <blackhole-law>+ % <space> } 
  token star-laws      { <star-law>+      % <space> } 
  token spacetime-laws { <spacetime-law>+ % <space> } 

  proto token galaxy-law  { * }
  token galaxy-law:sym<pretty>  { <<<sym>>> | 'p' | 'ℙ' }
  token galaxy-law:sym<cool>    { <<<sym>>> | '^.^' }
  token galaxy-law:sym<yolo>    { <<<sym>>> | 'y' }
  token galaxy-law:sym<cluster> { <<<sym>>> }
  token galaxy-law:sym<core>    { <sym> <.space>* <core> }
  token galaxy-law:sym<origin>  { <sym> <.space>* <location> }
  token galaxy-law:sym<law>     { <sym> <.space>  <location> }
  token galaxy-law:sym<nebula>  { <sym> <.space>  <location> }


  proto token gravity-law { * }
  token gravity-law:sym<core>    { <sym> <.space>* <core> }
  token gravity-law:sym<origin>  { <sym> <.space>* <location> }

  proto token blackhole-law { * }
  token blackhole-law:sym<core>    { <sym> <.space>* <core> }
  token blackhole-law:sym<origin>  { <sym> <.space>* <location> }

  proto token star-law  { * }
  token star-law:sym<remote> { <<<sym>>> | <<r>> }

  proto token spacetime-law { * }
  token spacetime-law:sym<travel>  { [<sym> | <<t>>] <.space>* <value> }

  token event    { 'event' }
  token core     { 'x86_64' | 'i386' }
  token value    { <!before \s> <-[ \s ]>+ <!after \s> }
  token location { <!before \s> <-[ \s ]>+ <!after \s> }
  #token x        { 'star' <space>  }                     # edge cases where star name is reserved word
}
