# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `minitest` gem.
# Please instead update this file by running `bin/tapioca gem minitest`.

::ACTIVE_SUPPORT_DEFINED = T.let(T.unsafe(nil), String)
::RUBY19 = T.let(T.unsafe(nil), TrueClass)

# Kernel extensions for minitest
module Kernel
  private

  # Describe a series of expectations for a given target +desc+.
  #
  # Defines a test class subclassing from either Minitest::Spec or
  # from the surrounding describe's class. The surrounding class may
  # subclass Minitest::Spec manually in order to easily share code:
  #
  #     class MySpec < Minitest::Spec
  #       # ... shared code ...
  #     end
  #
  #     class TestStuff < MySpec
  #       it "does stuff" do
  #         # shared code available here
  #       end
  #       describe "inner stuff" do
  #         it "still does stuff" do
  #           # ...and here
  #         end
  #       end
  #     end
  #
  # For more information on getting started with writing specs, see:
  #
  # http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html
  #
  # For some suggestions on how to improve your specs, try:
  #
  # http://betterspecs.org
  #
  # but do note that several items there are debatable or specific to
  # rspec.
  #
  # For more information about expectations, see Minitest::Expectations.
  def describe(desc, *additional_desc, &block); end
end

# :include: README.rdoc
module Minitest
  class << self
    # Internal run method. Responsible for telling all Runnable
    # sub-classes to run.
    def __run(reporter, options); end

    # A simple hook allowing you to run a block of code after everything
    # is done running. Eg:
    #
    #   Minitest.after_run { p $debugging_info }
    def after_run(&block); end

    # Registers Minitest to run at process exit
    def autorun; end

    def backtrace_filter; end
    def backtrace_filter=(_arg0); end
    def clock_time; end
    def extensions; end
    def extensions=(_arg0); end
    def filter_backtrace(bt); end
    def info_signal; end
    def info_signal=(_arg0); end
    def init_plugins(options); end
    def load_plugins; end
    def parallel_executor; end
    def parallel_executor=(_arg0); end
    def process_args(args = T.unsafe(nil)); end
    def reporter; end
    def reporter=(_arg0); end

    # This is the top-level run method. Everything starts from here. It
    # tells each Runnable sub-class to run, and each of those are
    # responsible for doing whatever they do.
    #
    # The overall structure of a run looks like this:
    #
    #   Minitest.autorun
    #     Minitest.run(args)
    #       Minitest.__run(reporter, options)
    #         Runnable.runnables.each
    #           runnable.run(reporter, options)
    #             self.runnable_methods.each
    #               self.run_one_method(self, runnable_method, reporter)
    #                 Minitest.run_one_method(klass, runnable_method)
    #                   klass.new(runnable_method).run
    def run(args = T.unsafe(nil)); end

    def run_one_method(klass, method_name); end
  end
end

# Defines the API for Reporters. Subclass this and override whatever
# you want. Go nuts.
class Minitest::AbstractReporter
  include ::Mutex_m

  def lock; end
  def locked?; end

  # Did this run pass?
  #
  # @return [Boolean]
  def passed?; end

  # About to start running a test. This allows a reporter to show
  # that it is starting or that we are in the middle of a test run.
  def prerecord(klass, name); end

  # Output and record the result of the test. Call
  # {result#result_code}[rdoc-ref:Runnable#result_code] to get the
  # result character string. Stores the result of the run if the run
  # did not pass.
  def record(result); end

  # Outputs the summary of the run.
  def report; end

  # Starts reporting on the run.
  def start; end

  def synchronize(&block); end
  def try_lock; end
  def unlock; end
end

# Represents run failures.
class Minitest::Assertion < ::Exception
  def error; end

  # Where was this run before an assertion was raised?
  def location; end

  def result_code; end
  def result_label; end
end

# Minitest Assertions.  All assertion methods accept a +msg+ which is
# printed if the assertion fails.
#
# Protocol: Nearly everything here boils up to +assert+, which
# expects to be able to increment an instance accessor named
# +assertions+. This is not provided by Assertions and must be
# provided by the thing including Assertions. See Minitest::Runnable
# for an example.
module Minitest::Assertions
  def _synchronize; end

  # Fails unless +test+ is truthy.
  def assert(test, msg = T.unsafe(nil)); end

  # Fails unless +obj+ is empty.
  def assert_empty(obj, msg = T.unsafe(nil)); end

  # Fails unless <tt>exp == act</tt> printing the difference between
  # the two, if possible.
  #
  # If there is no visible difference but the assertion fails, you
  # should suspect that your #== is buggy, or your inspect output is
  # missing crucial details.  For nicer structural diffing, set
  # Minitest::Test.make_my_diffs_pretty!
  #
  # For floats use assert_in_delta.
  #
  # See also: Minitest::Assertions.diff
  def assert_equal(exp, act, msg = T.unsafe(nil)); end

  # For comparing Floats.  Fails unless +exp+ and +act+ are within +delta+
  # of each other.
  #
  #   assert_in_delta Math::PI, (22.0 / 7.0), 0.01
  def assert_in_delta(exp, act, delta = T.unsafe(nil), msg = T.unsafe(nil)); end

  # For comparing Floats.  Fails unless +exp+ and +act+ have a relative
  # error less than +epsilon+.
  def assert_in_epsilon(exp, act, epsilon = T.unsafe(nil), msg = T.unsafe(nil)); end

  # Fails unless +collection+ includes +obj+.
  def assert_includes(collection, obj, msg = T.unsafe(nil)); end

  # Fails unless +obj+ is an instance of +cls+.
  def assert_instance_of(cls, obj, msg = T.unsafe(nil)); end

  # Fails unless +obj+ is a kind of +cls+.
  def assert_kind_of(cls, obj, msg = T.unsafe(nil)); end

  # Fails unless +matcher+ <tt>=~</tt> +obj+.
  def assert_match(matcher, obj, msg = T.unsafe(nil)); end

  # Fails unless +obj+ is nil
  def assert_nil(obj, msg = T.unsafe(nil)); end

  # For testing with binary operators. Eg:
  #
  #   assert_operator 5, :<=, 4
  def assert_operator(o1, op, o2 = T.unsafe(nil), msg = T.unsafe(nil)); end

  # Fails if stdout or stderr do not output the expected results.
  # Pass in nil if you don't care about that streams output. Pass in
  # "" if you require it to be silent. Pass in a regexp if you want
  # to pattern match.
  #
  #   assert_output(/hey/) { method_with_output }
  #
  # NOTE: this uses #capture_io, not #capture_subprocess_io.
  #
  # See also: #assert_silent
  def assert_output(stdout = T.unsafe(nil), stderr = T.unsafe(nil)); end

  # Fails unless +path+ exists.
  def assert_path_exists(path, msg = T.unsafe(nil)); end

  # For testing with predicates. Eg:
  #
  #   assert_predicate str, :empty?
  #
  # This is really meant for specs and is front-ended by assert_operator:
  #
  #   str.must_be :empty?
  def assert_predicate(o1, op, msg = T.unsafe(nil)); end

  # Fails unless the block raises one of +exp+. Returns the
  # exception matched so you can check the message, attributes, etc.
  #
  # +exp+ takes an optional message on the end to help explain
  # failures and defaults to StandardError if no exception class is
  # passed. Eg:
  #
  #   assert_raises(CustomError) { method_with_custom_error }
  #
  # With custom error message:
  #
  #   assert_raises(CustomError, 'This should have raised CustomError') { method_with_custom_error }
  #
  # Using the returned object:
  #
  #   error = assert_raises(CustomError) do
  #     raise CustomError, 'This is really bad'
  #   end
  #
  #   assert_equal 'This is really bad', error.message
  def assert_raises(*exp); end

  # Fails unless +obj+ responds to +meth+.
  def assert_respond_to(obj, meth, msg = T.unsafe(nil)); end

  # Fails unless +exp+ and +act+ are #equal?
  def assert_same(exp, act, msg = T.unsafe(nil)); end

  # +send_ary+ is a receiver, message and arguments.
  #
  # Fails unless the call returns a true value
  def assert_send(send_ary, m = T.unsafe(nil)); end

  # Fails if the block outputs anything to stderr or stdout.
  #
  # See also: #assert_output
  def assert_silent; end

  # Fails unless the block throws +sym+
  def assert_throws(sym, msg = T.unsafe(nil)); end

  # Captures $stdout and $stderr into strings:
  #
  #   out, err = capture_io do
  #     puts "Some info"
  #     warn "You did a bad thing"
  #   end
  #
  #   assert_match %r%info%, out
  #   assert_match %r%bad%, err
  #
  # NOTE: For efficiency, this method uses StringIO and does not
  # capture IO for subprocesses. Use #capture_subprocess_io for
  # that.
  def capture_io; end

  # Captures $stdout and $stderr into strings, using Tempfile to
  # ensure that subprocess IO is captured as well.
  #
  #   out, err = capture_subprocess_io do
  #     system "echo Some info"
  #     system "echo You did a bad thing 1>&2"
  #   end
  #
  #   assert_match %r%info%, out
  #   assert_match %r%bad%, err
  #
  # NOTE: This method is approximately 10x slower than #capture_io so
  # only use it when you need to test the output of a subprocess.
  def capture_subprocess_io; end

  # Returns a diff between +exp+ and +act+. If there is no known
  # diff command or if it doesn't make sense to diff the output
  # (single line, short output), then it simply returns a basic
  # comparison between the two.
  #
  # See +things_to_diff+ for more info.
  def diff(exp, act); end

  # Returns details for exception +e+
  def exception_details(e, msg); end

  # Fails after a given date (in the local time zone). This allows
  # you to put time-bombs in your tests if you need to keep
  # something around until a later date lest you forget about it.
  def fail_after(y, m, d, msg); end

  # Fails with +msg+.
  def flunk(msg = T.unsafe(nil)); end

  # Returns a proc that will output +msg+ along with the default message.
  def message(msg = T.unsafe(nil), ending = T.unsafe(nil), &default); end

  # This returns a human-readable version of +obj+. By default
  # #inspect is called. You can override this to use #pretty_inspect
  # if you want.
  #
  # See Minitest::Test.make_my_diffs_pretty!
  def mu_pp(obj); end

  # This returns a diff-able more human-readable version of +obj+.
  # This differs from the regular mu_pp because it expands escaped
  # newlines and makes hex-values (like object_ids) generic. This
  # uses mu_pp to do the first pass and then cleans it up.
  def mu_pp_for_diff(obj); end

  # used for counting assertions
  def pass(_msg = T.unsafe(nil)); end

  # Fails if +test+ is truthy.
  def refute(test, msg = T.unsafe(nil)); end

  # Fails if +obj+ is empty.
  def refute_empty(obj, msg = T.unsafe(nil)); end

  # Fails if <tt>exp == act</tt>.
  #
  # For floats use refute_in_delta.
  def refute_equal(exp, act, msg = T.unsafe(nil)); end

  # For comparing Floats.  Fails if +exp+ is within +delta+ of +act+.
  #
  #   refute_in_delta Math::PI, (22.0 / 7.0)
  def refute_in_delta(exp, act, delta = T.unsafe(nil), msg = T.unsafe(nil)); end

  # For comparing Floats.  Fails if +exp+ and +act+ have a relative error
  # less than +epsilon+.
  def refute_in_epsilon(a, b, epsilon = T.unsafe(nil), msg = T.unsafe(nil)); end

  # Fails if +collection+ includes +obj+.
  def refute_includes(collection, obj, msg = T.unsafe(nil)); end

  # Fails if +obj+ is an instance of +cls+.
  def refute_instance_of(cls, obj, msg = T.unsafe(nil)); end

  # Fails if +obj+ is a kind of +cls+.
  def refute_kind_of(cls, obj, msg = T.unsafe(nil)); end

  # Fails if +matcher+ <tt>=~</tt> +obj+.
  def refute_match(matcher, obj, msg = T.unsafe(nil)); end

  # Fails if +obj+ is nil.
  def refute_nil(obj, msg = T.unsafe(nil)); end

  # Fails if +o1+ is not +op+ +o2+. Eg:
  #
  #   refute_operator 1, :>, 2 #=> pass
  #   refute_operator 1, :<, 2 #=> fail
  def refute_operator(o1, op, o2 = T.unsafe(nil), msg = T.unsafe(nil)); end

  # Fails if +path+ exists.
  def refute_path_exists(path, msg = T.unsafe(nil)); end

  # For testing with predicates.
  #
  #   refute_predicate str, :empty?
  #
  # This is really meant for specs and is front-ended by refute_operator:
  #
  #   str.wont_be :empty?
  def refute_predicate(o1, op, msg = T.unsafe(nil)); end

  # Fails if +obj+ responds to the message +meth+.
  def refute_respond_to(obj, meth, msg = T.unsafe(nil)); end

  # Fails if +exp+ is the same (by object identity) as +act+.
  def refute_same(exp, act, msg = T.unsafe(nil)); end

  # Skips the current run. If run in verbose-mode, the skipped run
  # gets listed at the end of the run but doesn't cause a failure
  # exit code.
  #
  # @raise [Minitest::Skip]
  def skip(msg = T.unsafe(nil), bt = T.unsafe(nil)); end

  # Skips the current run until a given date (in the local time
  # zone). This allows you to put some fixes on hold until a later
  # date, but still holds you accountable and prevents you from
  # forgetting it.
  def skip_until(y, m, d, msg); end

  # Was this testcase skipped? Meant for #teardown.
  #
  # @return [Boolean]
  def skipped?; end

  # Returns things to diff [expect, butwas], or [nil, nil] if nothing to diff.
  #
  # Criterion:
  #
  # 1. Strings include newlines or escaped newlines, but not both.
  # 2. or:  String lengths are > 30 characters.
  # 3. or:  Strings are equal to each other (but maybe different encodings?).
  # 4. and: we found a diff executable.
  def things_to_diff(exp, act); end

  class << self
    # Returns the diff command to use in #diff. Tries to intelligently
    # figure out what diff to use.
    def diff; end

    # Set the diff command to use in #diff.
    def diff=(o); end
  end
end

Minitest::Assertions::E = T.let(T.unsafe(nil), String)
Minitest::Assertions::UNDEFINED = T.let(T.unsafe(nil), Object)

# The standard backtrace filter for minitest.
#
# See Minitest.backtrace_filter=.
class Minitest::BacktraceFilter
  # Filter +bt+ to something useful. Returns the whole thing if
  # $DEBUG (ruby) or $MT_DEBUG (env).
  def filter(bt); end
end

Minitest::BacktraceFilter::MT_RE = T.let(T.unsafe(nil), Regexp)

# Dispatch to multiple reporters as one.
class Minitest::CompositeReporter < ::Minitest::AbstractReporter
  # @return [CompositeReporter] a new instance of CompositeReporter
  def initialize(*reporters); end

  # Add another reporter to the mix.
  def <<(reporter); end

  def io; end

  # @return [Boolean]
  def passed?; end

  def prerecord(klass, name); end
  def record(result); end
  def report; end

  # The list of reporters to dispatch to.
  def reporters; end

  # The list of reporters to dispatch to.
  def reporters=(_arg0); end

  def start; end
end

Minitest::ENCS = T.let(T.unsafe(nil), TrueClass)

class Minitest::Expectation < ::Struct
  def ctx; end
  def ctx=(_); end
  def must_be(*args); end
  def must_be_close_to(*args); end
  def must_be_empty(*args); end
  def must_be_instance_of(*args); end
  def must_be_kind_of(*args); end
  def must_be_nil(*args); end
  def must_be_same_as(*args); end
  def must_be_silent(*args); end
  def must_be_within_delta(*args); end
  def must_be_within_epsilon(*args); end
  def must_equal(*args); end
  def must_include(*args); end
  def must_match(*args); end
  def must_output(*args); end
  def must_raise(*args); end
  def must_respond_to(*args); end
  def must_throw(*args); end
  def path_must_exist(*args); end
  def path_wont_exist(*args); end
  def target; end
  def target=(_); end
  def wont_be(*args); end
  def wont_be_close_to(*args); end
  def wont_be_empty(*args); end
  def wont_be_instance_of(*args); end
  def wont_be_kind_of(*args); end
  def wont_be_nil(*args); end
  def wont_be_same_as(*args); end
  def wont_be_within_delta(*args); end
  def wont_be_within_epsilon(*args); end
  def wont_equal(*args); end
  def wont_include(*args); end
  def wont_match(*args); end
  def wont_respond_to(*args); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

# It's where you hide your "assertions".
#
# Please note, because of the way that expectations are implemented,
# all expectations (eg must_equal) are dependent upon a thread local
# variable +:current_spec+. If your specs rely on mixing threads into
# the specs themselves, you're better off using assertions or the new
# _(value) wrapper. For example:
#
#     it "should still work in threads" do
#       my_threaded_thingy do
#         (1+1).must_equal 2                  # bad
#         assert_equal 2, 1+1                 # good
#         _(1 + 1).must_equal 2               # good
#         value(1 + 1).must_equal 2           # good, also #expect
#         _ { 1 + "1" }.must_raise TypeError  # good
#       end
#     end
module Minitest::Expectations
  def must_be(*args); end
  def must_be_close_to(*args); end
  def must_be_empty(*args); end
  def must_be_instance_of(*args); end
  def must_be_kind_of(*args); end
  def must_be_nil(*args); end
  def must_be_same_as(*args); end
  def must_be_silent(*args); end
  def must_be_within_delta(*args); end
  def must_be_within_epsilon(*args); end
  def must_equal(*args); end
  def must_include(*args); end
  def must_match(*args); end
  def must_output(*args); end
  def must_raise(*args); end
  def must_respond_to(*args); end
  def must_throw(*args); end
  def path_must_exist(*args); end
  def path_wont_exist(*args); end
  def wont_be(*args); end
  def wont_be_close_to(*args); end
  def wont_be_empty(*args); end
  def wont_be_instance_of(*args); end
  def wont_be_kind_of(*args); end
  def wont_be_nil(*args); end
  def wont_be_same_as(*args); end
  def wont_be_within_delta(*args); end
  def wont_be_within_epsilon(*args); end
  def wont_equal(*args); end
  def wont_include(*args); end
  def wont_match(*args); end
  def wont_respond_to(*args); end
end

# Provides a simple set of guards that you can use in your tests
# to skip execution if it is not applicable. These methods are
# mixed into Test as both instance and class methods so you
# can use them inside or outside of the test methods.
#
#   def test_something_for_mri
#     skip "bug 1234"  if jruby?
#     # ...
#   end
#
#   if windows? then
#     # ... lots of test methods ...
#   end
module Minitest::Guard
  # Is this running on jruby?
  #
  # @return [Boolean]
  def jruby?(platform = T.unsafe(nil)); end

  # Is this running on maglev?
  #
  # @return [Boolean]
  def maglev?(platform = T.unsafe(nil)); end

  # Is this running on mri?
  #
  # @return [Boolean]
  def mri?(platform = T.unsafe(nil)); end

  # Is this running on macOS?
  #
  # @return [Boolean]
  def osx?(platform = T.unsafe(nil)); end

  # Is this running on rubinius?
  #
  # @return [Boolean]
  def rubinius?(platform = T.unsafe(nil)); end

  # Is this running on windows?
  #
  # @return [Boolean]
  def windows?(platform = T.unsafe(nil)); end
end

module Minitest::Parallel; end

# The engine used to run multiple tests in parallel.
class Minitest::Parallel::Executor
  # Create a parallel test executor of with +size+ workers.
  #
  # @return [Executor] a new instance of Executor
  def initialize(size); end

  # Add a job to the queue
  def <<(work); end

  # Shuts down the pool of workers by signalling them to quit and
  # waiting for them all to finish what they're currently working
  # on.
  def shutdown; end

  # The size of the pool of workers.
  def size; end

  # Start the executor
  def start; end
end

module Minitest::Parallel::Test
  def _synchronize; end
end

module Minitest::Parallel::Test::ClassMethods
  def run_one_method(klass, method_name, reporter); end
  def test_order; end
end

# A very simple reporter that prints the "dots" during the run.
#
# This is added to the top-level CompositeReporter at the start of
# the run. If you want to change the output of minitest via a
# plugin, pull this out of the composite and replace it with your
# own.
class Minitest::ProgressReporter < ::Minitest::Reporter
  def prerecord(klass, name); end
  def record(result); end
end

# Shared code for anything that can get passed to a Reporter. See
# Minitest::Test & Minitest::Result.
module Minitest::Reportable
  # @raise [NotImplementedError]
  def class_name; end

  # Did this run error?
  #
  # @return [Boolean]
  def error?; end

  # The location identifier of this test. Depends on a method
  # existing called class_name.
  def location; end

  # Did this run pass?
  #
  # Note: skipped runs are not considered passing, but they don't
  # cause the process to exit non-zero.
  #
  # @return [Boolean]
  def passed?; end

  # Returns ".", "F", or "E" based on the result of the run.
  def result_code; end

  # Was this run skipped?
  #
  # @return [Boolean]
  def skipped?; end
end

class Minitest::Reporter < ::Minitest::AbstractReporter
  # @return [Reporter] a new instance of Reporter
  def initialize(io = T.unsafe(nil), options = T.unsafe(nil)); end

  # The IO used to report.
  def io; end

  # The IO used to report.
  def io=(_arg0); end

  # Command-line options for this run.
  def options; end

  # Command-line options for this run.
  def options=(_arg0); end
end

# This represents a test result in a clean way that can be
# marshalled over a wire. Tests can do anything they want to the
# test instance and can create conditions that cause Marshal.dump to
# blow up. By using Result.from(a_test) you can be reasonably sure
# that the test result can be marshalled.
class Minitest::Result < ::Minitest::Runnable
  include ::Minitest::Reportable

  def class_name; end

  # The class name of the test result.
  def klass; end

  # The class name of the test result.
  def klass=(_arg0); end

  # The location of the test method.
  def source_location; end

  # The location of the test method.
  def source_location=(_arg0); end

  def to_s; end

  class << self
    # Create a new test result from a Runnable instance.
    def from(runnable); end
  end
end

# re-open
class Minitest::Runnable
  # @return [Runnable] a new instance of Runnable
  def initialize(name); end

  # Number of assertions executed in this run.
  def assertions; end

  # Number of assertions executed in this run.
  def assertions=(_arg0); end

  def failure; end

  # An assertion raised during the run, if any.
  def failures; end

  # An assertion raised during the run, if any.
  def failures=(_arg0); end

  def marshal_dump; end
  def marshal_load(ary); end

  # Name of the run.
  def name; end

  # Set the name of the run.
  def name=(o); end

  # Did this run pass?
  #
  # Note: skipped runs are not considered passing, but they don't
  # cause the process to exit non-zero.
  #
  # @raise [NotImplementedError]
  # @return [Boolean]
  def passed?; end

  # Returns a single character string to print based on the result
  # of the run. One of <tt>"."</tt>, <tt>"F"</tt>,
  # <tt>"E"</tt> or <tt>"S"</tt>.
  #
  # @raise [NotImplementedError]
  def result_code; end

  # Runs a single method. Needs to return self.
  #
  # @raise [NotImplementedError]
  def run; end

  # Was this run skipped? See #passed? for more information.
  #
  # @raise [NotImplementedError]
  # @return [Boolean]
  def skipped?; end

  # The time it took to run.
  def time; end

  # The time it took to run.
  def time=(_arg0); end

  def time_it; end

  class << self
    def inherited(klass); end

    # Returns all instance methods matching the pattern +re+.
    def methods_matching(re); end

    def on_signal(name, action); end
    def reset; end

    # Responsible for running all runnable methods in a given class,
    # each in its own instance. Each instance is passed to the
    # reporter to record.
    def run(reporter, options = T.unsafe(nil)); end

    # Runs a single method and has the reporter record the result.
    # This was considered internal API but is factored out of run so
    # that subclasses can specialize the running of an individual
    # test. See Minitest::ParallelTest::ClassMethods for an example.
    def run_one_method(klass, method_name, reporter); end

    # Each subclass of Runnable is responsible for overriding this
    # method to return all runnable methods. See #methods_matching.
    #
    # @raise [NotImplementedError]
    def runnable_methods; end

    # Returns all subclasses of Runnable.
    def runnables; end

    def with_info_handler(reporter, &block); end
  end
end

Minitest::Runnable::SIGNALS = T.let(T.unsafe(nil), Hash)

# Assertion raised when skipping a run.
class Minitest::Skip < ::Minitest::Assertion
  def result_label; end
end

# Minitest::Spec -- The faster, better, less-magical spec framework!
#
# For a list of expectations, see Minitest::Expectations.
class Minitest::Spec < ::Minitest::Test
  include ::Minitest::Spec::DSL::InstanceMethods
  extend ::Minitest::Spec::DSL

  # @return [Spec] a new instance of Spec
  def initialize(name); end

  class << self
    def current; end
  end
end

# Oh look! A Minitest::Spec::DSL module! Eat your heart out DHH.
module Minitest::Spec::DSL
  # Define an 'after' action. Inherits the way normal methods should.
  #
  # NOTE: +type+ is ignored and is only there to make porting easier.
  #
  # Equivalent to Minitest::Test#teardown.
  def after(_type = T.unsafe(nil), &block); end

  # Define a 'before' action. Inherits the way normal methods should.
  #
  # NOTE: +type+ is ignored and is only there to make porting easier.
  #
  # Equivalent to Minitest::Test#setup.
  def before(_type = T.unsafe(nil), &block); end

  def children; end
  def create(name, desc); end
  def desc; end
  def describe_stack; end

  # Define an expectation with name +desc+. Name gets morphed to a
  # proper test method name. For some freakish reason, people who
  # write specs don't like class inheritance, so this goes way out of
  # its way to make sure that expectations aren't inherited.
  #
  # This is also aliased to #specify and doesn't require a +desc+ arg.
  #
  # Hint: If you _do_ want inheritance, use minitest/test. You can mix
  # and match between assertions and expectations as much as you want.
  def it(desc = T.unsafe(nil), &block); end

  # Essentially, define an accessor for +name+ with +block+.
  #
  # Why use let instead of def? I honestly don't know.
  #
  # @raise [ArgumentError]
  def let(name, &block); end

  def name; end
  def nuke_test_methods!; end

  # Register a new type of spec that matches the spec's description.
  # This method can take either a Regexp and a spec class or a spec
  # class and a block that takes the description and returns true if
  # it matches.
  #
  # Eg:
  #
  #     register_spec_type(/Controller$/, Minitest::Spec::Rails)
  #
  # or:
  #
  #     register_spec_type(Minitest::Spec::RailsModel) do |desc|
  #       desc.superclass == ActiveRecord::Base
  #     end
  def register_spec_type(*args, &block); end

  # Figure out the spec class to use based on a spec's description. Eg:
  #
  #     spec_type("BlahController") # => Minitest::Spec::Rails
  def spec_type(desc, *additional); end

  # Define an expectation with name +desc+. Name gets morphed to a
  # proper test method name. For some freakish reason, people who
  # write specs don't like class inheritance, so this goes way out of
  # its way to make sure that expectations aren't inherited.
  #
  # This is also aliased to #specify and doesn't require a +desc+ arg.
  #
  # Hint: If you _do_ want inheritance, use minitest/test. You can mix
  # and match between assertions and expectations as much as you want.
  def specify(desc = T.unsafe(nil), &block); end

  # Another lazy man's accessor generator. Made even more lazy by
  # setting the name for you to +subject+.
  def subject(&block); end

  def to_s; end

  class << self
    def extended(obj); end
  end
end

# Rdoc... why are you so dumb?
module Minitest::Spec::DSL::InstanceMethods
  # Takes a value or a block and returns a value monad that has
  # all of Expectations methods available to it.
  #
  #   _(1 + 1).must_equal 2
  #
  # And for blocks:
  #
  #   _ { 1 + "1" }.must_raise TypeError
  #
  # This method of expectation-based testing is preferable to
  # straight-expectation methods (on Object) because it stores its
  # test context, bypassing our hacky use of thread-local variables.
  #
  # NOTE: At some point, the methods on Object will be deprecated
  # and then removed.
  #
  # It is also aliased to #value and #expect for your aesthetic
  # pleasure:
  #
  #         _(1 + 1).must_equal 2
  #     value(1 + 1).must_equal 2
  #    expect(1 + 1).must_equal 2
  def _(value = T.unsafe(nil), &block); end

  def before_setup; end

  # Takes a value or a block and returns a value monad that has
  # all of Expectations methods available to it.
  #
  #   _(1 + 1).must_equal 2
  #
  # And for blocks:
  #
  #   _ { 1 + "1" }.must_raise TypeError
  #
  # This method of expectation-based testing is preferable to
  # straight-expectation methods (on Object) because it stores its
  # test context, bypassing our hacky use of thread-local variables.
  #
  # NOTE: At some point, the methods on Object will be deprecated
  # and then removed.
  #
  # It is also aliased to #value and #expect for your aesthetic
  # pleasure:
  #
  #         _(1 + 1).must_equal 2
  #     value(1 + 1).must_equal 2
  #    expect(1 + 1).must_equal 2
  def expect(value = T.unsafe(nil), &block); end

  # Takes a value or a block and returns a value monad that has
  # all of Expectations methods available to it.
  #
  #   _(1 + 1).must_equal 2
  #
  # And for blocks:
  #
  #   _ { 1 + "1" }.must_raise TypeError
  #
  # This method of expectation-based testing is preferable to
  # straight-expectation methods (on Object) because it stores its
  # test context, bypassing our hacky use of thread-local variables.
  #
  # NOTE: At some point, the methods on Object will be deprecated
  # and then removed.
  #
  # It is also aliased to #value and #expect for your aesthetic
  # pleasure:
  #
  #         _(1 + 1).must_equal 2
  #     value(1 + 1).must_equal 2
  #    expect(1 + 1).must_equal 2
  def value(value = T.unsafe(nil), &block); end
end

# Contains pairs of matchers and Spec classes to be used to
# calculate the superclass of a top-level describe. This allows for
# automatically customizable spec types.
#
# See: register_spec_type and spec_type
Minitest::Spec::DSL::TYPES = T.let(T.unsafe(nil), Array)

Minitest::Spec::TYPES = T.let(T.unsafe(nil), Array)

# A reporter that gathers statistics about a test run. Does not do
# any IO because meant to be used as a parent class for a reporter
# that does.
#
# If you want to create an entirely different type of output (eg,
# CI, HTML, etc), this is the place to start.
#
# Example:
#
#   class JenkinsCIReporter < StatisticsReporter
#     def report
#       super  # Needed to calculate some statistics
#
#       print "<testsuite "
#       print "tests='#{count}' "
#       print "failures='#{failures}' "
#       # Remaining XML...
#     end
#   end
class Minitest::StatisticsReporter < ::Minitest::Reporter
  # @return [StatisticsReporter] a new instance of StatisticsReporter
  def initialize(io = T.unsafe(nil), options = T.unsafe(nil)); end

  # Total number of assertions.
  def assertions; end

  # Total number of assertions.
  def assertions=(_arg0); end

  # Total number of test cases.
  def count; end

  # Total number of test cases.
  def count=(_arg0); end

  # Total number of tests that erred.
  def errors; end

  # Total number of tests that erred.
  def errors=(_arg0); end

  # Total number of tests that failed.
  def failures; end

  # Total number of tests that failed.
  def failures=(_arg0); end

  # @return [Boolean]
  def passed?; end

  def record(result); end

  # Report on the tracked statistics.
  def report; end

  # An +Array+ of test cases that failed or were skipped.
  def results; end

  # An +Array+ of test cases that failed or were skipped.
  def results=(_arg0); end

  # Total number of tests that where skipped.
  def skips; end

  # Total number of tests that where skipped.
  def skips=(_arg0); end

  def start; end

  # Time the test run started. If available, the monotonic clock is
  # used and this is a +Float+, otherwise it's an instance of
  # +Time+.
  def start_time; end

  # Time the test run started. If available, the monotonic clock is
  # used and this is a +Float+, otherwise it's an instance of
  # +Time+.
  def start_time=(_arg0); end

  # Test run time. If available, the monotonic clock is used and
  # this is a +Float+, otherwise it's an instance of +Time+.
  def total_time; end

  # Test run time. If available, the monotonic clock is used and
  # this is a +Float+, otherwise it's an instance of +Time+.
  def total_time=(_arg0); end
end

# A reporter that prints the header, summary, and failure details at
# the end of the run.
#
# This is added to the top-level CompositeReporter at the start of
# the run. If you want to change the output of minitest via a
# plugin, pull this out of the composite and replace it with your
# own.
class Minitest::SummaryReporter < ::Minitest::StatisticsReporter
  def aggregated_results(io); end

  # Returns the value of attribute old_sync.
  def old_sync; end

  # Sets the attribute old_sync
  #
  # @param value the value to set the attribute old_sync to.
  def old_sync=(_arg0); end

  def report; end

  # :startdoc:
  def start; end

  def statistics; end
  def summary; end

  # :stopdoc:
  def sync; end

  # :stopdoc:
  def sync=(_arg0); end

  def to_s; end

  private

  def binary_string; end
end

# Subclass Test to create your own tests. Typically you'll want a
# Test subclass per implementation class.
#
# See Minitest::Assertions
class Minitest::Test < ::Minitest::Runnable
  include ::Minitest::Assertions
  include ::Minitest::Reportable
  include ::Minitest::Test::LifecycleHooks
  include ::Minitest::Guard
  extend ::Minitest::Guard

  # LifecycleHooks
  def capture_exceptions; end

  def class_name; end

  # Runs a single test with setup/teardown hooks.
  def run; end

  def sanitize_exception(e); end
  def with_info_handler(&block); end

  class << self
    # Call this at the top of your tests when you absolutely
    # positively need to have ordered tests. In doing so, you're
    # admitting that you suck and your tests are weak.
    def i_suck_and_my_tests_are_order_dependent!; end

    # Returns the value of attribute io_lock.
    def io_lock; end

    # Sets the attribute io_lock
    #
    # @param value the value to set the attribute io_lock to.
    def io_lock=(_arg0); end

    # Make diffs for this Test use #pretty_inspect so that diff
    # in assert_equal can have more details. NOTE: this is much slower
    # than the regular inspect but much more usable for complex
    # objects.
    def make_my_diffs_pretty!; end

    # Call this at the top of your tests when you want to run your
    # tests in parallel. In doing so, you're admitting that you rule
    # and your tests are awesome.
    def parallelize_me!; end

    # Returns all instance methods starting with "test_". Based on
    # #test_order, the methods are either sorted, randomized
    # (default), or run in parallel.
    def runnable_methods; end

    # Defines the order to run tests (:random by default). Override
    # this or use a convenience method to change it for your tests.
    def test_order; end
  end
end

# Provides before/after hooks for setup and teardown. These are
# meant for library writers, NOT for regular test authors. See
# #before_setup for an example.
module Minitest::Test::LifecycleHooks
  # Runs before every test, after setup. This hook is meant for
  # libraries to extend minitest. It is not meant to be used by
  # test developers.
  #
  # See #before_setup for an example.
  def after_setup; end

  # Runs after every test, after teardown. This hook is meant for
  # libraries to extend minitest. It is not meant to be used by
  # test developers.
  #
  # See #before_setup for an example.
  def after_teardown; end

  # Runs before every test, before setup. This hook is meant for
  # libraries to extend minitest. It is not meant to be used by
  # test developers.
  #
  # As a simplistic example:
  #
  #   module MyMinitestPlugin
  #     def before_setup
  #       super
  #       # ... stuff to do before setup is run
  #     end
  #
  #     def after_setup
  #       # ... stuff to do after setup is run
  #       super
  #     end
  #
  #     def before_teardown
  #       super
  #       # ... stuff to do before teardown is run
  #     end
  #
  #     def after_teardown
  #       # ... stuff to do after teardown is run
  #       super
  #     end
  #   end
  #
  #   class MiniTest::Test
  #     include MyMinitestPlugin
  #   end
  def before_setup; end

  # Runs after every test, before teardown. This hook is meant for
  # libraries to extend minitest. It is not meant to be used by
  # test developers.
  #
  # See #before_setup for an example.
  def before_teardown; end

  # Runs before every test. Use this to set up before each test
  # run.
  def setup; end

  # Runs after every test. Use this to clean up after each test
  # run.
  def teardown; end
end

Minitest::Test::PASSTHROUGH_EXCEPTIONS = T.let(T.unsafe(nil), Array)
Minitest::Test::TEARDOWN_METHODS = T.let(T.unsafe(nil), Array)

# Assertion wrapping an unexpected error that was raised during a run.
class Minitest::UnexpectedError < ::Minitest::Assertion
  # @return [UnexpectedError] a new instance of UnexpectedError
  def initialize(error); end

  def backtrace; end

  # TODO: figure out how to use `cause` instead
  def error; end

  # TODO: figure out how to use `cause` instead
  def error=(_arg0); end

  def message; end
  def result_label; end
end

class Minitest::Unit
  class << self
    def after_tests(&b); end
    def autorun; end
  end
end

class Minitest::Unit::TestCase < ::Minitest::Test
  class << self
    def inherited(klass); end
  end
end

Minitest::Unit::VERSION = T.let(T.unsafe(nil), String)
Minitest::VERSION = T.let(T.unsafe(nil), String)

class Module
  include ::Module::Concerning

  def infect_an_assertion(meth, new_name, dont_flip = T.unsafe(nil)); end
end

Module::DELEGATION_RESERVED_KEYWORDS = T.let(T.unsafe(nil), Array)
Module::DELEGATION_RESERVED_METHOD_NAMES = T.let(T.unsafe(nil), Set)
Module::RUBY_RESERVED_KEYWORDS = T.let(T.unsafe(nil), Array)

class Object < ::BasicObject
  include ::ActiveSupport::ToJsonWithActiveSupportEncoder
  include ::ActiveSupport::Dependencies::RequireDependency
  include ::Kernel
  include ::ActiveSupport::ForkTracker::CoreExt
  include ::ActiveSupport::ForkTracker::CoreExtPrivate
  include ::JSON::Ext::Generator::GeneratorMethods::Object
  include ::Minitest::Expectations
  include ::PP::ObjectMixin
  include ::ActiveSupport::Tryable
end
