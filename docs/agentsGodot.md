# Agent Guidelines: Godot Development Proficiency

## Executive Summary

**My Proficiency Level:** Beginner-to-Intermediate with strong tool-assisted capabilities

**Core Strengths:**
- GDScript programming and logic implementation
- System architecture and design patterns
- Problem-solving and debugging approaches
- Tool-assisted learning and adaptation

**Key Limitations:**
- Visual editor workflows and node configuration
- Advanced systems (shaders, complex animations, multiplayer)
- Godot-specific best practices and conventions
- Asset pipeline and optimization

**Strategy:** Leverage strengths in code/architecture while using available tools (MCP servers, documentation, web search) to fill knowledge gaps and ensure quality.

---

## Tool Usage Protocols

### 1. Godot MCP Servers (ALWAYS USE PROACTIVELY)


#### During Development:
- ✅ **Generate script templates** using `mcp_Godot_generate_script_template` for common patterns (player, manager, etc.)
- ✅ **Use UI component generator** `mcp_Godot_generate_ui_component` for menus, HUDs, dialogs
- ✅ **Analyze architecture** using `mcp_Godot_analyze_game_architecture` when designing systems
- ✅ **Check for errors** using `mcp_Godot_analyze_error_log` when issues arise

#### When Uncertain:
- ✅ **Use diagnostic tools** `mcp_Godot_diagnose_project` for comprehensive health checks
- ✅ **Get fix suggestions** using `mcp_Godot_suggest_fix` for specific error messages
- ✅ **Start debug sessions** using `mcp_Godot_start_debug_session` to monitor issues

#### Godot-One MCP Server (Project Management):
- ✅ **List projects** using `mcp_godot-one_list_projects` to find relevant examples
- ✅ **Get project info** using `mcp_godot-one_get_project_info` for configuration details
- ✅ **Create scenes** using `mcp_godot-one_create_scene` when needed
- ✅ **Add nodes** using `mcp_godot-one_add_node` for scene construction
- ✅ **Run and test** using `mcp_godot-one_run_project` to verify functionality

**Rule:** If I'm about to write code or create a scene, I MUST first check if similar patterns exist in the codebase or use template generators.

---

### 2. Context7 Documentation (CONSULT WHEN UNCERTAIN)

#### Always Use When:
- ⚠️ I'm not 100% certain about a Godot API or feature
- ⚠️ Working with systems I haven't used before (AnimationPlayer, Physics, etc.)
- ⚠️ Need to understand best practices for a specific feature
- ⚠️ Encountering version-specific behavior questions

#### Workflow:
1. **Resolve library ID** using `mcp_context7_resolve-library-id` with "godot" or specific feature
2. **Get documentation** using `mcp_context7_get-library-docs` with focused topic
3. **Review examples** in the documentation before implementing
4. **Verify** my implementation matches documented patterns

**Rule:** If I'm guessing about how something works, I MUST consult documentation first.

---

### 3. Web Search (RESEARCH COMPLEX TOPICS)

#### Use When:
- 🔍 Need community solutions or tutorials
- 🔍 Encountering specific error messages or edge cases
- 🔍 Looking for best practices or design patterns
- 🔍 Need to understand Godot-specific workflows

#### Workflow:
1. Search with specific, technical terms
2. Prioritize official Godot documentation and community forums
3. Look for code examples and explanations
4. Cross-reference with Context7 documentation when available

**Rule:** If documentation doesn't fully answer my question, search the web before implementing.

---

## Workflow Guidelines

### Pre-Development Checklist (ALWAYS)

Before starting any Godot task:

- [ ] **Analyze existing codebase** - Use MCP servers to find similar implementations
- [ ] **Check project structure** - Understand autoloads, project settings, scene organization
- [ ] **Review similar scenes/scripts** - Learn from existing patterns
- [ ] **Consult documentation** - If working with unfamiliar systems
- [ ] **Plan architecture** - Use `mcp_Godot_analyze_game_architecture` if designing systems
- [ ] **Generate templates** - Use MCP generators for common patterns
- [ ] **Plan debug output** - Think about what debug information will confirm the implementation works

### Development Workflow

#### 1. Scene Creation
```
1. Use mcp_godot-one_create_scene or mcp_Godot_generate_ui_component
2. Analyze similar scenes first (mcp_Godot_analyze_scene)
3. Add nodes incrementally (mcp_godot-one_add_node)
4. Test frequently (mcp_godot-one_run_project)
5. Verify node hierarchy matches Godot best practices
```

#### 2. Script Implementation
```
1. Generate template if available (mcp_Godot_generate_script_template)
2. Analyze similar scripts (mcp_Godot_analyze_script)
3. Consult Context7 docs for API usage
4. Implement incrementally with testing
5. Follow GDScript style guide (check documentation)
```

#### 3. Debugging
```
1. Use mcp_Godot_analyze_error_log for error analysis
2. Start debug session (mcp_Godot_start_debug_session)
3. Use mcp_Godot_suggest_fix for specific errors
4. Check project health (mcp_Godot_diagnose_project)
5. Review similar working code if available
```

#### 4. Integration & Testing
```
1. Add strategic debug output before testing
2. Run project frequently (mcp_godot-one_run_project)
3. Check debug output (mcp_godot-one_get_debug_output) - VERIFY EXPECTED BEHAVIOR
4. Compare actual vs. expected debug output
5. Fix issues found in debug output before proceeding
6. Verify scene structure (mcp_Godot_analyze_scene)
7. Test edge cases and error conditions
8. Ensure proper signal connections and node references
9. Clean up temporary debug output after verification
```

---

## Asset Import & Verification Protocol

### Critical for Working with Asset Kits

Since we're working with external assets (GLB, FBX, textures), I need a systematic approach to import and verify assets work correctly in Godot.

### Asset Import Workflow

#### 1. Before Importing:
- [ ] **Identify asset types** - GLB (preferred for web), FBX, textures (PNG)
- [ ] **Check asset structure** - Understand what's in the asset (meshes, animations, textures)
- [ ] **Note dependencies** - Textures referenced by models, animation files for characters
- [ ] **Plan organization** - Where assets should go in project structure

#### 2. Import Process:
- [ ] **Copy assets to project** - Place in appropriate folders (e.g., `res://assets/models/`, `res://assets/textures/`)
- [ ] **Let Godot auto-import** - Godot will detect and import assets automatically
- [ ] **Check import settings** - Verify import settings are appropriate (may need to check via MCP tools or documentation)
- [ ] **Verify textures linked** - Ensure texture references are resolved

#### 3. Verification Steps (CRITICAL):

**For 3D Models (GLB/FBX):**
- [ ] **Load in scene** - Instantiate the model in a test scene
- [ ] **Verify mesh visible** - Check via debug output or scene analysis
- [ ] **Check materials** - Verify materials/textures are applied
- [ ] **Test animations** - If animations included, verify they can be played
- [ ] **Check scale** - Verify model scale is appropriate (not too large/small)
- [ ] **Verify collision** - If collision needed, check collision shapes

**For Animations:**
- [ ] **Load animation file** - Import animation GLB/FBX
- [ ] **Check animation compatibility** - Verify animations work with target character
- [ ] **Test animation playback** - Use AnimationPlayer to test animations
- [ ] **Verify animation names** - Check animation clip names match expectations
- [ ] **Test animation transitions** - Verify smooth transitions between animations

**For Textures:**
- [ ] **Verify texture loads** - Check texture resource exists and loads
- [ ] **Check texture resolution** - Verify appropriate size (not too large/small)
- [ ] **Test texture application** - Apply to material and verify it displays

#### 4. Debug Output for Asset Verification:

```gdscript
# When loading assets, add debug output:
func _ready():
    # Verify model loaded
    var model = preload("res://assets/models/character.glb")
    if model:
        print("[AssetLoader] Model loaded successfully: ", model)
    else:
        print("[AssetLoader] ERROR: Failed to load model")
    
    # Verify animation loaded
    var anim_player = $AnimationPlayer
    if anim_player:
        var anim_names = anim_player.get_animation_list()
        print("[AssetLoader] Available animations: ", anim_names)
    
    # Verify texture loaded
    var texture = preload("res://assets/textures/character_texture.png")
    if texture:
        print("[AssetLoader] Texture loaded: ", texture.get_size())
```

#### 5. Common Asset Issues & Solutions:

**Model not visible:**
- Check import settings (may need to reimport)
- Verify material is assigned
- Check camera position/angle
- Verify model scale isn't too small/large

**Animations not working:**
- Verify skeleton compatibility
- Check animation names match
- Verify AnimationPlayer is set up correctly
- Check animation import settings

**Textures not showing:**
- Verify texture path is correct
- Check texture import settings
- Verify material is using texture
- Check texture format compatibility

#### 6. Using MCP Tools for Asset Verification:

- **Analyze scenes** - `mcp_Godot_analyze_scene` to check if assets are properly referenced
- **Check project info** - `mcp_Godot_get_project_info` to understand resource structure
- **Run project** - `mcp_godot-one_run_project` to test assets in runtime
- **Check debug output** - `mcp_godot-one_get_debug_output` for asset loading errors

**Rule:** Never assume assets work - always verify through testing and debug output.

---

## Error Recovery Workflow

### Structured Approach When Debug Output Reveals Issues

When debug output shows errors or unexpected behavior, follow this systematic recovery process:

### Step-by-Step Error Recovery:

#### 1. **Categorize the Error**
- 🚩 **Syntax/Compile Error** - Code won't compile
- 🚩 **Runtime Error** - Code compiles but crashes at runtime
- 🚩 **Logic Error** - Code runs but produces wrong results
- 🚩 **Resource Error** - Missing or incorrectly loaded resources
- 🚩 **Signal/Connection Error** - Signals not firing or connections broken

#### 2. **Gather Information**
- ✅ **Read full error message** - Don't just read the first line
- ✅ **Check error location** - File, line number, function
- ✅ **Review debug output context** - What happened before the error?
- ✅ **Check related code** - Functions called, nodes referenced
- ✅ **Use MCP tools** - `mcp_Godot_analyze_error_log`, `mcp_Godot_suggest_fix`

#### 3. **Isolate the Problem**
- ✅ **Identify minimal reproduction** - What's the smallest code that causes the error?
- ✅ **Check if error is consistent** - Does it happen every time or intermittently?
- ✅ **Verify related systems** - Is the error isolated or part of a larger issue?
- ✅ **Compare with working code** - Use `mcp_Godot_analyze_script` on similar working scripts

#### 4. **Research & Understand**
- ✅ **Consult documentation** - Use Context7 for API documentation
- ✅ **Search for similar errors** - Web search for error message
- ✅ **Check Godot version** - Some errors are version-specific
- ✅ **Review best practices** - Is this a common mistake?

#### 5. **Fix Strategically**
- ✅ **Fix root cause, not symptoms** - Address the underlying issue
- ✅ **Make minimal changes** - Don't rewrite everything, fix what's broken
- ✅ **Test incrementally** - Fix one thing, test, then move to next
- ✅ **Add debug output** - Verify the fix works as expected

#### 6. **Verify the Fix**
- ✅ **Run project** - `mcp_godot-one_run_project`
- ✅ **Check debug output** - Verify error is gone and behavior is correct
- ✅ **Test edge cases** - Ensure fix doesn't break other things
- ✅ **Re-run error analysis** - `mcp_Godot_analyze_error_log` to confirm clean

#### 7. **Document the Solution**
- ✅ **Note what caused the error** - For future reference
- ✅ **Document the fix** - How it was resolved
- ✅ **Update knowledge base** - Add to patterns/anti-patterns

### Error-Specific Recovery Protocols:

#### Syntax/Compile Errors:
```
1. Read error message carefully - usually very specific
2. Check line number and surrounding code
3. Verify GDScript syntax (indentation, brackets, etc.)
4. Check for typos in function/variable names
5. Verify all required imports/extends are present
6. Fix and recompile immediately
```

#### Runtime Errors (Null References, etc.):
```
1. Check debug output for null reference location
2. Verify node paths are correct ($NodePath syntax)
3. Check if nodes exist before accessing
4. Verify _ready() vs _process() timing issues
5. Add null checks before accessing nodes/resources
6. Test with debug output to verify fix
```

#### Logic Errors (Wrong Behavior):
```
1. Add strategic debug output to trace execution
2. Check expected vs actual values
3. Verify state transitions and conditions
4. Check for off-by-one errors, wrong operators
5. Compare with similar working code
6. Test incrementally to isolate issue
```

#### Resource Errors:
```
1. Verify resource paths are correct
2. Check if resources are imported properly
3. Verify preload() vs load() usage
4. Check resource exists before using
5. Verify import settings if needed
6. Test resource loading with debug output
```

### When to Escalate:

Escalate (ask for help) if:
- 🚩 Error persists after following recovery steps
- 🚩 Error is unclear or documentation doesn't help
- 🚩 Multiple related errors suggest architectural issue
- 🚩 Fix would require significant refactoring
- 🚩 Performance issues that can't be diagnosed

**Rule:** Don't spend excessive time on errors - follow recovery process, then escalate if needed.

---

## Incremental Testing Protocol

### Specific Guidance on Testing Cadence

"Test frequently" is too vague. Here's a specific protocol for when and how to test:

### Testing Cadence Guidelines:

#### After Each Function:
- ✅ **Write function** → **Add debug output** → **Test function** → **Verify output**
- ✅ **Don't write multiple functions** before testing the first
- ✅ **Verify function works** before moving to next

#### After Each Feature Component:
- ✅ **Complete component** (e.g., movement input handling)
- ✅ **Add comprehensive debug output**
- ✅ **Test component in isolation**
- ✅ **Verify expected behavior**
- ✅ **Then integrate with other components**

#### After Each Integration Step:
- ✅ **Integrate component A with component B**
- ✅ **Test integration immediately**
- ✅ **Check for conflicts or issues**
- ✅ **Fix before adding component C**

#### Before Major Milestones:
- ✅ **Test all components together**
- ✅ **Run full workflow test**
- ✅ **Verify no regressions**
- ✅ **Check performance**

### Minimum Viable Test (MVT):

For each feature, define the minimum test that confirms it works:

**Character Movement MVT:**
```
1. Add debug output for input detection
2. Press WASD keys
3. Verify debug output shows input received
4. Verify character position changes
5. Verify character rotation changes
6. Verify animation state changes
```

**UI Button MVT:**
```
1. Add debug output for button press
2. Click button
3. Verify debug output shows button pressed
4. Verify signal fires (if applicable)
5. Verify UI state changes (if applicable)
```

### Testing Workflow:

#### 1. **Pre-Test Setup:**
- Add strategic debug output
- Define expected behavior/output
- Set up test scene if needed

#### 2. **Execute Test:**
- Run project (`mcp_godot-one_run_project`)
- Perform test actions
- Monitor debug output (`mcp_godot-one_get_debug_output`)

#### 3. **Verify Results:**
- Compare actual vs expected debug output
- Check for errors or warnings
- Verify behavior matches expectations

#### 4. **Document Results:**
- Note what worked
- Note any issues found
- Update if expectations were wrong

### When to Test:

**Always Test:**
- ✅ After writing a new function
- ✅ After modifying existing function
- ✅ After integrating components
- ✅ Before marking task complete
- ✅ When debug output shows unexpected values

**Test More Frequently:**
- ⚠️ When working with unfamiliar APIs
- ⚠️ When debugging issues
- ⚠️ When making significant changes
- ⚠️ When performance is critical

**Can Test Less Frequently:**
- ✅ When making minor changes to working code
- ✅ When following established patterns
- ✅ When changes are isolated and well-understood

### Testing Checklist:

Before considering a feature complete:
- [ ] **MVT passed** - Minimum viable test confirms basic functionality
- [ ] **Debug output verified** - Expected output matches actual
- [ ] **No errors** - Clean console, no warnings
- [ ] **Edge cases tested** - Boundary conditions handled
- [ ] **Integration tested** - Works with other components
- [ ] **Performance acceptable** - No obvious bottlenecks

**Rule:** It's faster to test frequently and catch issues early than to debug complex problems later.

---

## Quality Assurance Checklist

### Before Considering Any Task Complete:

#### Code Quality:
- [ ] **GDScript follows style guide** - Proper naming, indentation, comments
- [ ] **No hardcoded values** - Use exports, constants, or configuration
- [ ] **Proper error handling** - Null checks, validation, graceful failures
- [ ] **Signal connections verified** - All signals properly connected
- [ ] **Node references valid** - Using `$` paths or proper get_node() calls

#### Scene Structure:
- [ ] **Node hierarchy logical** - Proper parent-child relationships
- [ ] **Signals connected** - Check in editor or via code
- [ ] **Resources properly assigned** - Materials, textures, scripts
- [ ] **Scene instancing works** - Can be instantiated without errors
- [ ] **No orphaned nodes** - All nodes serve a purpose

#### Functionality:
- [ ] **Tested in isolation** - Component works independently
- [ ] **Tested in context** - Works when integrated
- [ ] **Edge cases handled** - Null inputs, boundary conditions
- [ ] **Performance acceptable** - No obvious bottlenecks
- [ ] **Error messages clear** - Helpful debugging information
- [ ] **Debug output verified** - Console output confirms expected behavior
- [ ] **No unexpected errors** - Clean debug output, no warnings

#### Documentation:
- [ ] **Code commented** - Complex logic explained
- [ ] **Scene organized** - Clear node naming and grouping
- [ ] **Dependencies noted** - What this depends on and why

---

## Debugger Output & Verification Loop

### The Debugger as Primary Feedback Mechanism

**Critical Understanding:** Since I cannot see visual output (no screenshots, no visual feedback), the debugger/console output is my **primary way to verify that implementations work correctly**. I must treat debug output as essential feedback, not optional.

### Closing the Loop Strategy

#### Before Responding to User:
- ✅ **Always verify** - Run the project and check debug output
- ✅ **Confirm behavior** - Debug output should match expected behavior
- ✅ **Catch errors early** - Debug output reveals issues before user reports them
- ✅ **Iterate if needed** - Fix issues found in debug output before responding

#### Debug Output Philosophy:
1. **Add strategic debug output** - Think about what information would confirm the code works
2. **Use debug output to verify** - Check that values, states, and flow match expectations
3. **Clean up after verification** - Remove debug output once confirmed working (unless it's useful long-term)
4. **Keep it informative** - Debug output should clearly indicate what's happening

### When to Add Debug Output

#### Always Add For:
- ✅ **State changes** - When objects change state (idle → walking, alive → dead)
- ✅ **Function entry/exit** - Confirm functions are being called
- ✅ **Critical values** - Position, velocity, health, scores, etc.
- ✅ **Error conditions** - When something goes wrong
- ✅ **Signal emissions** - Confirm signals are firing
- ✅ **Node references** - Verify nodes are found/connected correctly
- ✅ **Animation transitions** - Confirm animations are playing

#### Task-Specific Debug Output:

**Character Movement:**
```gdscript
# Add debug output for:
- Input received (which keys pressed)
- Movement vector calculated
- Position updates
- Rotation changes
- Animation state changes
- Collision detection
```

**UI Systems:**
```gdscript
# Add debug output for:
- Button presses
- Signal connections
- UI state changes
- Data updates (health, score, etc.)
```

**Game Systems:**
```gdscript
# Add debug output for:
- System initialization
- State machine transitions
- Resource loading
- Event handling
```

**Scene Management:**
```gdscript
# Add debug output for:
- Scene loading/unloading
- Node instantiation
- Signal connections
- Resource references
```

### Debug Output Best Practices

#### Format for Clarity:
```gdscript
# Good - Clear, contextual information
print("[CharacterController] Movement: forward=%d, right=%d, speed=%.2f" % [forward, right, speed])
print("[GameManager] State changed: %s -> %s" % [old_state, new_state])
print("[UI] Health updated: %d/%d" % [current_health, max_health])

# Bad - Unclear, no context
print(forward)
print("changed")
print(value)
```

#### Use Debug Categories:
```gdscript
# Use prefixes to filter debug output
print("[DEBUG] [CharacterController] ...")
print("[INFO] [GameManager] ...")
print("[WARNING] [Physics] ...")
print("[ERROR] [ResourceLoader] ...")
```

#### Conditional Debug Output:
```gdscript
# Use a debug flag for easy toggling
const DEBUG_MODE = true

if DEBUG_MODE:
    print("[CharacterController] Position: ", position)
```

### Verification Workflow

#### Step-by-Step Verification Process:

1. **Add Strategic Debug Output**
   - Think: "What would confirm this works?"
   - Add output at key points: entry, state changes, critical calculations
   - Use clear, descriptive messages

2. **Run and Observe**
   - Execute the project (`mcp_godot-one_run_project`)
   - Monitor debug output (`mcp_godot-one_get_debug_output`)
   - Check for expected vs. actual behavior

3. **Verify Expected Behavior**
   - Do values match expectations?
   - Are functions being called?
   - Are state transitions correct?
   - Are signals firing?

4. **Identify Issues**
   - Compare debug output to expected output
   - Look for errors, warnings, unexpected values
   - Check for missing calls or incorrect flow

5. **Iterate if Needed**
   - Fix issues found in debug output
   - Re-run and verify again
   - Continue until debug output confirms correct behavior

6. **Clean Up (After Verification)**
   - Remove temporary debug output
   - Keep only essential debug output (if any)
   - Document any debug output that remains

### Debug Output Examples

#### Character Controller Verification:
```gdscript
func _process(delta):
    var input_vector = get_input_vector()
    
    # Debug: Verify input is being received
    if DEBUG_MODE:
        print("[CharacterController] Input: ", input_vector)
    
    if input_vector.length() > 0:
        # Debug: Verify movement calculation
        var movement = input_vector * speed * delta
        if DEBUG_MODE:
            print("[CharacterController] Moving: ", movement, " at speed: ", speed)
        
        move_and_slide(movement)
        
        # Debug: Verify position update
        if DEBUG_MODE:
            print("[CharacterController] New position: ", global_position)
```

#### Signal Connection Verification:
```gdscript
func _ready():
    # Debug: Verify signal connection
    if button.pressed.connect(_on_button_pressed) == OK:
        print("[UI] Button signal connected successfully")
    else:
        print("[UI] ERROR: Failed to connect button signal")
```

#### State Machine Verification:
```gdscript
func change_state(new_state):
    var old_state = current_state
    current_state = new_state
    
    # Debug: Verify state transition
    print("[StateMachine] State changed: %s -> %s" % [old_state, new_state])
    
    # Verify state-specific behavior
    match new_state:
        State.IDLE:
            print("[StateMachine] Entering IDLE state")
        State.WALKING:
            print("[StateMachine] Entering WALKING state")
```

### Using MCP Debug Tools

#### Debug Session Management:
1. **Start debug session** - `mcp_Godot_start_debug_session` when investigating issues
2. **Monitor output** - `mcp_godot-one_get_debug_output` to see console messages
3. **Analyze errors** - `mcp_Godot_analyze_error_log` for error details
4. **Get suggestions** - `mcp_Godot_suggest_fix` for specific errors
5. **Stop session** - `mcp_Godot_stop_debug_session` when done

#### Integration with Verification:
- Use debug sessions to monitor output during development
- Check debug output after each significant change
- Use error analysis tools when issues appear
- Verify fixes by checking debug output again

### Cleanup Protocol

#### After Verification:
- ✅ **Remove temporary debug output** - Clean up test/debug prints
- ✅ **Keep essential output** - Only if it provides ongoing value
- ✅ **Document remaining output** - If debug output stays, note why
- ✅ **Use debug flags** - Make it easy to toggle debug output on/off

#### What to Keep:
- Error logging (always useful)
- Critical state changes (if helpful for debugging)
- Performance metrics (if monitoring)
- User-facing information (if appropriate)

#### What to Remove:
- Verbose per-frame output (after verification)
- Test values and temporary checks
- Redundant information
- Development-only debugging

### Red Flags in Debug Output

#### Watch For:
- 🚩 **No output when expected** - Functions not being called
- 🚩 **Unexpected values** - Calculations producing wrong results
- 🚩 **Missing signals** - Events not firing
- 🚩 **Null references** - Nodes/resources not found
- 🚩 **Infinite loops** - Repeated output without progress
- 🚩 **State inconsistencies** - States not transitioning correctly

#### When Debug Output Reveals Issues:
1. **Don't ignore it** - Debug output is telling you something
2. **Investigate immediately** - Use MCP tools to analyze
3. **Fix before responding** - Don't report success if debug shows problems
4. **Re-verify** - Check debug output again after fixes

### Pre-Response Checklist

Before responding to the user about completed work:

- [ ] **Project runs without errors** - Checked via debug output
- [ ] **Expected debug output present** - Confirms functionality works
- [ ] **No unexpected errors/warnings** - Clean console output
- [ ] **Values match expectations** - Debug output shows correct behavior
- [ ] **Temporary debug output removed** - Cleaned up test output
- [ ] **Essential debug output documented** - If any remains, explained why

### Remember:

- 🎯 **Debug output is my eyes** - I can't see visual output, so debug output is critical
- 🎯 **Verify before responding** - Always check debug output before claiming success
- 🎯 **Think strategically** - Add debug output that confirms what I need to know
- 🎯 **Clean up after** - Remove temporary debug output to keep code clean
- 🎯 **Use tools** - Leverage MCP debug tools to monitor and analyze output

---

## Red Flags & Escalation

### STOP and Ask for Help When:

#### Technical Uncertainty:
- 🚩 **I'm guessing** about how a Godot system works
- 🚩 **Documentation unclear** or conflicting information found
- 🚩 **Multiple approaches** possible and unsure which is best
- 🚩 **Error persists** after using diagnostic tools
- 🚩 **Performance issues** I can't diagnose

#### Architecture Decisions:
- 🚩 **Designing complex systems** without understanding Godot patterns
- 🚩 **Uncertain about scene structure** or node organization
- 🚩 **Need to choose** between multiple implementation approaches
- 🚩 **Integration concerns** between systems

#### Best Practices:
- 🚩 **Uncertain about Godot conventions** for a feature
- 🚩 **Not sure if approach** follows engine best practices
- 🚩 **Version-specific behavior** questions

### Escalation Process:

1. **Document the uncertainty** - What I know, what I don't know, what I've tried
2. **Show research** - What documentation/tools I've consulted
3. **Present options** - If multiple approaches exist, list them with pros/cons
4. **Ask specific questions** - Not "how do I do this?" but "should I use X or Y approach?"

---

## Best Practices (Godot-Specific)

### Scene Organization:
- ✅ **Use scene inheritance** - Create base scenes for reusable components
- ✅ **Group related nodes** - Use Node groups or custom nodes
- ✅ **Name nodes clearly** - Descriptive names, not "Node2D", "Sprite2D"
- ✅ **Use signals** - Prefer signals over direct references when appropriate
- ✅ **Autoloads for singletons** - GameManager, AudioManager, etc.

### Script Patterns:
- ✅ **Use `@export`** - For inspector-configurable properties
- ✅ **Use `@onready`** - For node references initialized after _ready()
- ✅ **Signal connections** - Connect in code or editor, document connections
- ✅ **Error handling** - Check node existence before accessing
- ✅ **Resource management** - Preload resources when possible

### Performance:
- ✅ **Object pooling** - For frequently spawned objects (enemies, projectiles)
- ✅ **Avoid per-frame lookups** - Cache node references
- ✅ **Use groups** - Instead of searching scene tree repeatedly
- ✅ **Batch operations** - When processing multiple nodes
- ✅ **Profile when needed** - Use Godot profiler for bottlenecks

### Animation:
- ✅ **Use AnimationPlayer** - For complex animations
- ✅ **Use Tween** - For simple interpolations
- ✅ **AnimationTree** - For complex state machines
- ✅ **Test animation timing** - Ensure smooth transitions

---

## Learning & Adaptation Strategy

### Building Knowledge Over Time:

#### Pattern Recognition:
- **Document patterns** - When I find a good solution, note it for reuse
- **Create templates** - Build reusable scene/script templates
- **Learn from existing code** - Analyze working projects before creating new ones
- **Identify anti-patterns** - Learn what doesn't work and why

#### Incremental Improvement:
- **Start simple** - Get basic functionality working first
- **Iterate and refine** - Add complexity gradually
- **Test frequently** - Catch issues early
- **Refactor when needed** - Improve code structure as understanding grows

#### Knowledge Documentation:
- **Note Godot quirks** - Document engine-specific behaviors
- **Track solutions** - Keep notes on how problems were solved
- **Update this guide** - Add new patterns and best practices discovered
- **Share learnings** - Explain decisions and approaches

### Confidence Levels:

#### High Confidence (Proceed):
- ✅ I've done this before successfully
- ✅ Documentation is clear and I understand it
- ✅ Similar code exists in the project
- ✅ MCP tools confirm the approach

#### Medium Confidence (Verify):
- ⚠️ Conceptually understand but haven't implemented
- ⚠️ Documentation exists but need to reference it
- ⚠️ Similar patterns exist but need adaptation
- ⚠️ **Action:** Consult docs, analyze similar code, test incrementally

#### Low Confidence (Research First):
- 🚩 Never done this before
- 🚩 Documentation unclear or missing
- 🚩 No similar examples in codebase
- 🚩 **Action:** Use all available tools (MCP, Context7, web search), then ask if still uncertain

---

## Common Tasks & Protocols

### Importing & Setting Up Character Assets:
1. Copy character GLB file to project assets folder
2. Let Godot auto-import the asset
3. Create test scene and instantiate character model
4. Add debug output to verify model loads correctly
5. Check if animations are included or need separate import
6. Test animation compatibility (if using external animations)
7. Verify textures are applied correctly
8. Check scale and adjust if needed
9. Test in scene before integrating into game

### Creating a Character Controller:
1. Analyze existing character controllers (`mcp_Godot_analyze_script` on similar scripts)
2. Generate template (`mcp_Godot_generate_script_template` with "player" type)
3. Consult Context7 docs for CharacterBody3D/CharacterBody2D
4. Implement movement incrementally
5. **Test after each function** (follow Incremental Testing Protocol)
6. Add debug output for input, movement, rotation
7. Test with debug session
8. Verify animation integration
9. Test edge cases (boundary conditions, null inputs)

### Setting Up UI:
1. Use UI component generator (`mcp_Godot_generate_ui_component`)
2. Analyze existing UI scenes
3. Consult documentation for Control nodes
4. Test responsiveness and layout
5. Verify signal connections

### Implementing Game Systems:
1. Analyze game architecture (`mcp_Godot_analyze_game_architecture`)
2. Check project info for autoloads (`mcp_Godot_get_project_info`)
3. Design using Godot patterns (signals, groups, autoloads)
4. Generate manager template if needed
5. Integrate incrementally with testing

### Debugging Issues:
1. Analyze error log (`mcp_Godot_analyze_error_log`)
2. Get fix suggestions (`mcp_Godot_suggest_fix`)
3. Start debug session (`mcp_Godot_start_debug_session`)
4. Check project health (`mcp_Godot_diagnose_project`)
5. Review similar working code

---

## Session Workflow

### Start of Session:
1. **Get project info** - Understand current state
2. **List scenes/scripts** - See what exists
3. **Analyze architecture** - Understand overall structure
4. **Review recent changes** - Understand context

### During Development:
1. **Use tools proactively** - Don't wait for problems
2. **Add debug output strategically** - Think about what confirms functionality
3. **Test frequently** - Run project often and check debug output
4. **Verify debug output** - Ensure actual matches expected behavior
5. **Document decisions** - Explain why, not just what
6. **Verify quality** - Use checklist before marking complete

### End of Session:
1. **Verify functionality** - Everything works as expected
2. **Check debug output** - Verify expected behavior via console output
3. **Check for errors** - No warnings or errors in console
4. **Clean up debug output** - Remove temporary debug prints
5. **Document changes** - What was done and why
6. **Note learnings** - Update knowledge base

---

## Final Reminders

### Always:
- ✅ Use MCP servers before guessing
- ✅ Consult documentation when uncertain
- ✅ Test incrementally
- ✅ Follow Godot conventions
- ✅ Ask when genuinely stuck

### Never:
- ❌ Guess about Godot APIs
- ❌ Skip testing
- ❌ Ignore errors or warnings
- ❌ Create overly complex solutions
- ❌ Work in isolation without tools

### Remember:
- 🎯 **Tools are my strength** - Use them proactively
- 🎯 **Quality over speed** - Better to verify than redo
- 🎯 **Learn continuously** - Each session builds knowledge
- 🎯 **Ask when needed** - Uncertainty is a signal to research or ask

---

## Project-Specific Documentation

### Documentation Structure

This project uses a self-sustaining documentation system:

1. **PROJECT.md** - Main project documentation
   - Current status and completed features
   - Technical specifications
   - Project structure
   - Next steps

2. **LEARNINGS.md** - Development learnings and workflows
   - Session-specific learnings
   - Streamlined workflows for common tasks
   - Code patterns to reuse
   - Common pitfalls and solutions

3. **SESSION_NOTES.md** - Session summaries
   - What was accomplished
   - Key decisions made
   - Files created/modified
   - Notes for next session

### Documentation Maintenance Rules

**To Prevent Bloat:**
- ✅ Update existing sections rather than adding new ones
- ✅ Remove outdated information when updating
- ✅ Keep examples concise and focused
- ✅ Reference other files instead of duplicating content

**To Ensure Seamless Development:**
- ✅ Always check PROJECT.md for current status
- ✅ Review LEARNINGS.md before starting similar tasks
- ✅ Update SESSION_NOTES.md at end of each session
- ✅ Add new patterns to LEARNINGS.md when discovered

**When to Update Documentation:**
- ✅ After completing a major feature (update PROJECT.md)
- ✅ When discovering a new pattern (add to LEARNINGS.md)
- ✅ At end of each session (update SESSION_NOTES.md)
- ✅ When fixing a common issue (add to LEARNINGS.md pitfalls)

**When NOT to Update:**
- ❌ Don't document temporary debugging code
- ❌ Don't add redundant information already documented
- ❌ Don't create new files for single-use information
- ❌ Don't document obvious or trivial things

### Project-Specific Workflows

See `LEARNINGS.md` for:
- Asset implementation workflow
- Sprite sheet analysis process
- Animation system patterns
- Common code patterns to reuse

---

*This document should be reviewed and updated as proficiency grows and new patterns are discovered.*

